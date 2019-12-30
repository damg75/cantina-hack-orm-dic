require_relative '../../models/category'
require_relative '../../models/client'
require_relative '../../models/invoice'
require_relative '../../models/product'
require_relative '../../models/sale'
require_relative 'draw'
require_relative 'client_handler'
require_relative 'product_handler'

class Shopping_handler

    def self.handler 
        loop do
            Draw.main_menu
            Draw.shopping_handler_menu
            Shopping_handler.input_handler
        end
    end

    def self.input_handler
        selector = gets.chomp
        case selector
            when 's'
                Shopping_handler.shopping
            when 'x'
                Shopping_handler.exit_shopping_handler
        end
    end

    def self.exit_shopping_handler
        raise StopIteration
    end

    def self.shopping
        loop do
            # begin
                system('clear')
                Draw.main_menu
                puts
                puts 'Bienvenido a Gestion de Compras'
                puts 
                puts 'Es usted cliente nuevo? y/n'
                puts 
                puts 'x: para salir'
                selector = gets.chomp.to_s
                while selector != 'y' && selector != 'n' && selector != 'x'
                    puts  'y/n para responder'
                    selector = gets.chomp.to_s
                end
                case selector
                    when 'y'
                        Client_handler.create_a_client
                    when 'x'
                        raise StopIteration
                end
                system('clear')
                puts 'Gestion de Compras'
                puts 
                puts 'Lista de clientes:'
                puts
                array = []
                Client.all.each do |element|
                    array << element
                end
                array.each do |element|
                    puts
                    element.attributes.each do |key, value|
                    print "#{key}: #{value} "
                    end
                    puts
                end
                puts
                puts
                puts 'Escoja el id que le pertenece como cliente'
                client_id = gets.chomp.to_i
                client_shopper = Client.find(client_id)
                puts
                client_shopper.attributes.each do |key,value|
                print "#{key}: #{value} "
                puts  
                end
                puts 
                puts 'Desea continuar con el proceso de compra y/n?'
                selector = gets.chomp.to_s
                while selector != 'y' && selector != 'n'
                    puts  'y/n para responder'
                    selector = gets.chomp.to_s
                end
                case selector
                when 'y'
                    Shopping_handler.shopping_cart(client_shopper)
                when 'n'
                    selector = 'x'
                end
                # rescue => exception
                #     puts 'input invalido'
                #     puts 'presione cualquier tecla para continuar'
                #     continuator = gets.chomp
                # end
        break if selector == 'x'
        end

    end
            
    def self.shopping_cart(client_shopper)
        time = Time.new
        invoice_hash = { invoice_date: time.strftime("%Y/%m/%d"), client_id: client_shopper.id }
        invoice = Invoice.create(invoice_hash)
        shopping_cart = [] #arreglo de hashes
        loop do
            system('clear')
            puts 'Carrito de productos'
            puts 
            puts 'x: para salir'
            puts
            client_shopper.attributes.each do |key,value|
                print "#{key}: #{value} "
                puts
            end
            puts
            puts
            invoice.attributes.each do |key, value|
                print "#{key}: #{value} "
                puts
            end
            puts
            puts
            if shopping_cart.size > 0
                shopping_cart.each do |sale|
                    producto = Product.find_by(id: sale.product_id)
                    puts producto.product_name
                    puts
                    sale.attributes.each do |key, value|
                        print "#{key}: #{value} "
                        puts
                    end
                end
            end
            puts
            puts 'Desea seguir agregando productos al carrito? y/n'
            selector = gets.chomp.to_s
            while selector != 'y' && selector != 'n'
                puts  'y/n para responder'
                selector = gets.chomp.to_s
            end
            case selector
            when 'y'
                Shopping_handler.cart_shopping(client_shopper,shopping_cart,invoice)
            when 'n'
                #deberia confirmar la compra o generar un recibo
                raise StopIteration
            end

            
            
            
            
            
            break if selector == 'x'
        end
    end

    def self.cart_shopping(client_shopper,shopping_cart,invoice)
        system('clear')
        puts 'Shopping por categoria'
        puts
        puts 'Lista de Categorias:'
        puts
        array = []
        Category.all.each do |element|
            array << element
        end
        array.each do |element|
            puts
            element.attributes.each do |key, value|
                print "#{key}: #{value} "
            end
            puts
        end
        puts
        puts 'Escoja la id de la categoria del producto'
        cat_id = gets.chomp.to_i
        while cat_id != 1 && cat_id != 2 && cat_id != 3
            puts 'Ingrese id valido'
            cat_id = gets.chomp.to_i
        end
        category = Category.find_by(id: cat_id)
        system('clear')
        category.products.each do |products|
            puts
            products.attributes.each do |key,value|
                print "#{key}: #{value} "
                puts
            end
        end
        puts
        puts 'Escoja id de producto a agregar'
        product_id = gets.chomp.to_i
        product = Product.find_by(id: product_id)
        system('clear')
        product.attributes.each do |key,value|
            print "#{key}: #{value} "
            puts
        end
        puts
        puts "Cantidad diponible de producto: #{product.product_quantity}"
        puts
        puts 'Indique cantidad de producto a comprar'
        sale_quantity = gets.chomp.to_i
        while sale_quantity > product.product_quantity
            puts 'Cantidad de compra debe ser menor o igual a la cantidad disponible de producto'
            sale_quantity = gets.chomp.to_i
        end
        puts
        sale_price = sale_quantity * product.selling_price
        sale_hash = {product_id: product.id, sale_quantity: sale_quantity, sale_price: sale_price, invoice_id: invoice.id}
        sale = Sale.new(sale_hash)
        puts "Total a pagar por esta adicion al carrito: #{sale_price}"
        puts "Total de unidades de producto a agregar al carrito: #{sale_quantity}"
        puts 
        puts sale.attributes.each do |key,value|
            print "#{key}: #{value} "
            puts
        end
        puts 'Para confirmar adicion al carrito y/n'
        selector = gets.chomp.to_s
        while selector != 'y' && selector != 'n' && selector != 'x'
            puts  'y/n para responder'
            selector = gets.chomp.to_s
        end
        case selector
            when 'y'
                sale.save
                shopping_cart << sale
            when 'n'
                sale.destroy
        end

        continuator = gets.chomp
    end

end    