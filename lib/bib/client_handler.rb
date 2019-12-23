require_relative 'draw'
require_relative '../../models/client'

# puts 'Gestion de Clientes:'
# puts 
# puts 'q: Lista de clientes/Busqueda de Clientes'
# puts
# puts 'w: Crear/Actualizar un Cliente'
# puts
# puts 'e: Eliminar un Cliente'
# puts
# puts 'x: Salir'
# puts

class Client_handler

    def self.handler   
        loop do
            Draw.main_menu
            Draw.client_handler_menu
            Client_handler.input_handler
        end
    end
    
    def self.input_handler
        selector = gets.chomp
        case selector
            when 'q'
                Client_handler.client_read
            when 'x'
                Client_handler.exit_client_handler
        end
    end

    def self.exit_client_handler
        raise StopIteration
    end

    def self.client_read
        loop do
            system('clear')
            Draw.main_menu
            puts
            puts 'Lista de clientes/Busqueda de Clientes'
            puts
            puts 'q: Lista de clientes'
            puts
            puts 'w: Busqueda de Clientes'
            puts
            puts 'x: Salir al menu anterior'
            puts
            selector = gets.chomp
            case selector
                when 'q'
                    system('clear')
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
                    puts 'Presione cualquier tecla para continuar'
                    puts
                    continuator = gets.chomp
                when 'w'
                    loop do
                        begin
                            system('clear')
                            Draw.main_menu
                            puts
                            puts 'Busqueda de Clientes'
                            puts
                            puts 'Buscar por llave:'
                            puts
                            puts '0 - client_id'
                            puts '1 - client_name'
                            puts '2 - client_last_name'
                            puts '3 - client_rif'
                            puts 'x - para salir'
                            puts
                            selector = gets.chomp
                            Client_handler.client_search(selector)
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
                    Client_handler.exit_client_handler
            end
        end
    end

    def self.client_search(selector)
        case selector
            when '0'
                system('clear')
                puts 'Buscar por llave:'
                begin
                    puts   
                    puts '0 - client_id'
                    puts
                    puts 'Ingrese client_id:'
                    client_attribute = gets.chomp.to_i
                    client_search = Client.find(client_attribute)
                    puts
                    client_search.attributes.each do |key,value|
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
                    puts '1 - client_name'
                    puts
                    puts 'Ingrese client_name:'
                    client_name = gets.chomp.to_s
                    querys = []
                    Client.where(client_name: client_name).all.each do |query|
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
                    puts '2 - client_last_name'
                    puts
                    puts 'Ingrese client_name:'
                    client_last_name = gets.chomp.to_s
                    querys = []
                    Client.where(client_last_name: client_last_name).all.each do |query|
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
            when '3'
                system('clear')
                puts 'Buscar por llave:'
                begin
                    puts '3 - client_rif'
                    puts
                    puts 'Ingrese client_name:'
                    client_rif = gets.chomp.to_s
                    querys = []
                    Client.where(client_rif: client_rif).all.each do |query|
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
        end
    end


end