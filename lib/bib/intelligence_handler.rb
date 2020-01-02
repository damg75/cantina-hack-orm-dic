require_relative '../../models/category'
require_relative '../../models/client'
require_relative '../../models/invoice'
require_relative '../../models/product'
require_relative '../../models/sale'
require_relative 'draw'
require_relative 'client_handler'
require_relative 'product_handler'

# puts 'Inteligencia del Negocio'
# puts 
# puts 'w: Productos mas vendidos'
# puts 
# puts 'e: Productos menos vendidos en un rango de fechas'
# puts
# puts 'a: Mejor cliente'
# puts
# puts 's: Ventas en un rango de fechas'
# puts
# puts 'd: Histórico de compras de un producto por cliente y el montputs 'Presione cualquier tecla para volver al menur anterior, x para salir'o total'
# puts
# puts 'z: Consulta de saldo de un cliente'
# puts
# puts 'x: Salir al menu anterior'

class Intelligence_handler
    puts 'Presione cualquier tecla para volver al menur anterior'
    def self.handler 
        loop do
            Draw.main_menu
            Draw.intelligence_handler_menu
            Intelligence_handler.input_handler
        end
    end

    def self.input_handler
        puts
        selector = gets.chomp
        case selector
            when 'w'
                Intelligence_handler.most_sold_products
            when 'x'
                Intelligence_handler.exit_intelligence_handler
        end
    end

    def self.exit_intelligence_handler
        raise StopIteration
    end

    def self.most_sold_products
        loop do
            system('clear')
            puts 'Productos mas vendidos'
            puts 
            puts 'a: Productos mas vendidos por unidades'
            puts
            puts 's: Productos mas vendidos por montos de venta totales'
            puts
            puts 'x: Salir al menu anterior'
            puts
            selector = gets.chomp
            case selector
                when 'a'
                    system('clear')
                    array = []
                    Draw.main_menu
                    puts
                    puts 'Productos mas vendidos por unidades'
                    puts
                    Product.all.each do |product|
                        sale_hash = {product_name: product.product_name, 
                                        product_id: product.id,
                                        sale_quantity: product.sales.sum("sale_quantity"), 
                                        sale_price: product.sales.sum("sale_price")
                                    }
                        array << sale_hash
                    end
                    sorted_array = array.sort_by!{ |sale_hash| sale_hash[:sale_quantity] }
                    sorted_array.reverse!
                    sorted_array.each do |hash|
                        hash.each do |key,value|
                            puts "#{key}:  #{value}"
                        end
                        puts
                    end
                    puts 'Presione cualquier tecla para volver al menur anterior, x para salir'
                    continuator = gets.chomp
                when 's'
                    system('clear')
                    array = []
                    Draw.main_menu
                    puts
                    puts 'Productos mas vendidos por montos de venta totales'
                    puts
                    Product.all.each do |product|
                        sale_hash = {product_name: product.product_name, 
                                        product_id: product.id,
                                        sale_price: product.sales.sum("sale_price"),
                                        sale_quantity: product.sales.sum("sale_quantity")
                                    }
                        array << sale_hash
                    end
                    sorted_array = array.sort_by!{ |sale_hash| sale_hash[:sale_price] }
                    sorted_array.reverse!
                    sorted_array.each do |hash|
                        hash.each do |key,value|
                            puts "#{key}:  #{value}"
                        end
                        puts
                    end
                    puts 'Presione cualquier tecla para volver al menur anterior, x para salir'
                    continuator = gets.chomp
                when 'x'
                    raise StopIteration
            end
        break if continuator == 'x'
        end
    end



end