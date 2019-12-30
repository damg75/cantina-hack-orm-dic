require_relative 'draw'
require_relative '../../models/product'
require_relative '../../models/category'

# puts 'Gestion de Productos:'
# puts 
# puts 'q: Lista de Productos/Busqueda de Productos'
# puts
# puts 'w: Crear/Actualizar/Eliminar un Producto'
# puts
# puts 'x: Salir al menu anterior'
# puts

class Product_handler

    def self.handler   
        loop do
            Draw.main_menu
            Draw.product_handler_menu
            Product_handler.input_handler
        end
    end
    
    def self.input_handler
        selector = gets.chomp
        case selector
            when 'q'
                Product_handler.product_read
            when 'x'
                Product_handler.exit_product_handler
            when 'w'
                Product_handler.product_create_update
        end
    end

    def self.exit_product_handler
        raise StopIteration
    end

    def self.product_read
        loop do
            system('clear')
            Draw.main_menu
            puts
            puts 'Lista de Productos/Busqueda de Productos'
            puts
            puts 'q: Lista de Productos'
            puts
            puts 'w: Busqueda de Productos'
            puts
            puts 'x: Salir al menu anterior'
            puts
            selector = gets.chomp
            case selector
                when 'q'
                    system('clear')
                    puts 'Lista de Productos:'
                    puts
                    array = []
                    Product.all.each do |element|
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
                    puts 'Presione cualquier tecla para continuar'
                    puts
                    continuator = gets.chomp
                when 'w'
                    loop do
                        begin
                            system('clear')
                            Draw.main_menu
                            puts
                            puts 'Busqueda de Productos'
                            puts
                            puts 'Buscar por llave:'
                            puts
                            puts '0 - product_id'
                            puts '1 - product_name'
                            puts '2 - category_id'
                            puts 'x - para salir'
                            puts
                            selector = gets.chomp
                            Product_handler.product_search(selector)
                            case selector
                                when 'x'
                                    breaker = true
                            end
                        rescue => exception
                            puts
                            puts 'error en el input, ingrese cualquier tecla para continuar'
                            puts
                            continuator = gets.chomp
                        end
                     break if breaker == true
                    end
                when 'x'
                    Product_handler.exit_product_handler
            end
        end
    end

    def self.product_search(selector)
        case selector
            when '0'
                system('clear')
                puts 'Buscar por llave:'
                begin
                    puts   
                    puts '0 - product_id'
                    puts
                    puts 'Ingrese product_id:'
                    product_attribute = gets.chomp.to_i
                    product_search = Product.find(product_attribute)
                    puts
                    product_search.attributes.each do |key,value|
                    print "#{key}: #{value} "
                    puts  
                    end
                    puts
                rescue => exception
                    puts 'campo no registrado, ingrese cualquier tecla para continuar'
                end
                puts 'Presione cualquier tecla para continuar'
                continuator = gets.chomp
            when '1'
                system('clear')
                puts 'Buscar por llave:'
                begin
                    puts '1 - product_name'
                    puts
                    puts 'Ingrese product_name:'
                    product_name = gets.chomp.to_s
                    querys = []
                    Product.where(product_name: product_name).all.each do |query|
                        querys << query
                    end
                    if querys.size >= 1
                        querys.each do |query|
                            puts
                            query.attributes.each do |key,value|
                                print "#{key}: #{value} "
                                puts  
                            end
                        end
                        puts
                    else    
                        puts 'campo no registrado'
                    end
                rescue => exception
                    puts 'campo no registrado'
                end
                puts 'Presione cualquier tecla para continuar'
                continuator = gets.chomp
            when '2'
                system('clear')
                puts 'Buscar por llave:'
                begin
                    puts '2 - category_id'
                    puts
                    puts 'Ingrese category_id:'
                    category_id = gets.chomp.to_i
                    category = Category.find_by(id: category_id)
                    querys = []
                    Product.where(category_id: category_id).all.each do |query|
                        querys << query
                    end
                    if querys.size >= 1
                        puts
                        puts "Categoria: #{category.category_name}"
                        querys.each do |query|
                            puts
                            query.attributes.each do |key,value|
                                print "#{key}: #{value} "
                                puts  
                            end
                        end
                        puts
                    else    
                        puts 'campo no registrado'
                    end
                rescue => exception
                    puts 'campo no registrado'
                end
                puts 'Presione cualquier tecla para continuar'
                continuator = gets.chomp
        end
    end

    def self.product_create_update
        loop do
            system('clear')
            Draw.main_menu
            puts
            puts 'Crear/Actualizar/Eliminar un Producto'
            puts
            puts 'q: Crear un Producto'
            puts
            puts 'w: Actualizar/Eliminar un Producto'
            puts
            puts 'x: Salir al menu anterior'
            puts
            selector = gets.chomp
            case selector
                when 'q'
                    Product_handler.create_a_product
                when 'w'
                    Product_handler.update_a_product
                when 'x'
                    breaker = true
            end
         break if breaker == true
        end
    end

    def self.create_a_product
        system('clear')
        puts 'Crear un producto'
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
        puts 'Ingrese nombre del producto ej: Shawarma de Pollo'
        product_name = gets.chomp.to_s
        puts 'Ingrese descripcion del producto ej: Shawarma que lleva Pollo'
        product_description = gets.chomp.to_s
        puts 'Ingrese cantidad del producto ej: 10'
        product_quantity = gets.chomp.to_i
        puts 'Ingrese precio de venta ej: 10.5'
        selling_price = gets.chomp.to_d
        product_hash = { 
            product_name: product_name, 
            product_description: product_description, 
            product_quantity: product_quantity, 
            selling_price: selling_price,
            category_id: category.id
         }
        product = Product.new(product_hash)
        puts 'Revise el hash antes de persistir en la base de datos. y/n para persistir en la base de datos'
        puts
        puts 'Recibira confirmacion de la base de datos si pasa validaciones'
        puts
        product_hash.each do |key,value|
            print "#{key}: #{value} "
            puts
        end
        selector = gets.chomp.to_s
        while selector != 'y' && selector != 'n'
            puts  'y/n para persistir en la base de datos'
            selector = gets.chomp.to_s
        end
        case selector
            when 'y'
                product.save
            when 'n'
                product.destroy
        end
        puts 'Presione cualquier tecla para continuar'
        continuator = gets.chomp
    end

    def self.update_a_product
        system('clear')
        puts
        puts 'Actualizar/Eliminar un Producto'
        puts
        products = []
        Product.all.each do |product|
        products << product
        end
        products.each do |product|
            product.attributes.each do |key, value|
                print "#{key}: #{value} "
            end
            puts
        end
        puts
        begin
            puts 'seleccione el id del Producto a Actualizar/Eliminar'
            product_id = gets.chomp.to_i
            product_update = Product.find(product_id)
            puts
            product_update.attributes.each do |key,value|
                print "#{key}: #{value} "
                puts  
            end
            loop do
                system('clear')
                product_update = Product.find(product_id)
                product_update.attributes.each do |key,value|
                    print "#{key}: #{value} "
                    puts  
                end
                puts
                puts 'Campos a actualizar:'
                puts '1 - product_name'
                puts '2 - product_description'
                puts '3 - product_quantity'
                puts '4 - selling_price'
                puts '5 - category_id'
                puts 'r - revisar cambios'
                puts '+++++++++++++++++++++++'
                puts 'd - eliminar producto'
                puts 'x - para salir'
        
                selector = gets.chomp.to_s
        
                case selector
                    when '1'
                        puts 'Ingrese nuevo nombre del producto ej: Shawarma de Carne'
                        product_name = gets.chomp.to_s
                        product_hash = {product_name: product_name}
                        Product.update(product_id, product_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '2'
                        puts 'Ingrese nueva descripcion del producto ej: Shawarma que contiene Carne'
                        product_description = gets.chomp.to_s
                        product_hash = {product_description: product_description}
                        Product.update(product_id, product_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '3'
                        puts 'Ingrese nueva cantidad del producto ej: 10'
                        product_quantity = gets.chomp.to_i
                        product_hash = {product_quantity: product_quantity}
                        Product.update(product_id, product_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '4'
                        puts 'Ingrese nuevo precio de venta del producto ej: 10.6'
                        selling_price = gets.chomp.to_s
                        product_hash = {selling_price: selling_price}
                        Product.update(product_id, product_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '5'
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
                        product_hash = {category_id: category.id}
                        Product.update(product_id, product_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when 'r'
                        system('clear')
                        product_update.attributes.each do |key,value|
                        print "#{key}: #{value} "
                        puts  
                        end
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when 'd'
                        puts
                        product_update.attributes.each do |key,value|
                        print "#{key}: #{value} "
                        puts  
                        end
                        puts
                        puts 'y/n para confirmar eliminar producto'
                        selector = gets.chomp
                        while selector != 'y' && selector != 'n'
                            puts 'y/n para confirmar eliminar producto'
                            selector = gets.chomp
                        end
                        if selector == 'y'
                            product_update.destroy
                            puts
                            puts 'Presione cualquier tecla para continuar'
                            continuator = gets.chomp
                            breaker = true
                        end
                    when 'x'
                        breaker = true
                end

             break if breaker == true
            end
        rescue => exception
            puts 'input invalido'
            puts 'presione cualquier tecla para continuar'
            continuator = gets.chomp
        end
    end

end

