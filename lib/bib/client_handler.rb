require_relative 'draw'
require_relative '../../models/client'

# puts 'Gestion de Clientes:'
# puts 
# puts 'q: Lista de clientes/Busqueda de Clientes'
# puts
# puts 'w: Crear/Actualizar/Eliminar un Cliente'
# puts
# puts 'x: Salir al menu anterior'
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
            when 'w'
                Client_handler.client_create_update
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

    def self.client_create_update
        loop do
            system('clear')
            Draw.main_menu
            puts
            puts 'Crear/Actualizar/Eliminar un Cliente'
            puts
            puts 'q: Crear un Cliente'
            puts
            puts 'w: Actualizar/Eliminar un Cliente'
            puts
            puts 'x: Salir al menu anterior'
            puts
            selector = gets.chomp
            case selector
                when 'q'
                    Client_handler.create_a_client
                when 'w'
                    Client_handler.update_a_client
                when 'x'
                    breaker = true
            end
         break if breaker == true
        end
    end

    def self.create_a_client
        system('clear')
        puts 'Crear un cliente'
        puts 'Ingrese nombre del cliente ej: Pedro'
        client_name = gets.chomp.to_s
        puts 'Ingrese apellido del cliente ej: Perez'
        client_last_name = gets.chomp.to_s
        puts 'Ingrese rif del cliente ej: V-19721880'
        client_rif = gets.chomp.to_s
        puts 'Ingrese direccion del cliente ej: Manzanares'
        client_address = gets.chomp.to_s
        puts 'Ingrese email del cliente ej: cliente@email.com'
        client_email = gets.chomp.to_s
        puts 'Ingrese telefono del cliente ej: 04141339317'
        client_phone = gets.chomp.to_s
        puts 'Ingrese el saldo inicial del cliente ej: 900, saldo positivos mayores a 0'
        client_balance = gets.chomp.to_d
        if client_balance >= 1000
            client_balance = client_balance * 1.02
            puts
            puts 'Carga >= 1000. Felicidades, bono de 2% a su recarga'
            puts
        end
        client_hash = { 
            client_name: client_name, 
            client_last_name: client_last_name, 
            client_rif: client_rif, 
            client_address: client_address,
            client_email: client_email,
            client_phone: client_phone,
            client_balance: client_balance
         }
        client = Client.new(client_hash)
        puts 'Revise el hash antes de persistir en la base de datos. y/n para persistir en la base de datos'
        puts
        puts 'Recibira confirmacion de la base de datos si pasa validaciones'
        puts
        client_hash.each do |key,value|
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
                client.save
            when 'n'
                client.destroy
        end
        puts 'Presione cualquier tecla para continuar'
        continuator = gets.chomp
    end

    def self.update_a_client
        system('clear')
        puts
        puts 'Actualizar/Eliminar un Cliente'
        puts
        clients = []
        Client.all.each do |client|
        clients << client
        end
        clients.each do |client|
            client.attributes.each do |key, value|
                print "#{key}: #{value} "
            end
            puts
        end
        puts
        begin    
            puts 'seleccione el id del Cliente a actualizar/eliminar'
            client_id = gets.chomp.to_i
            client_update = Client.find(client_id)
            puts
            client_update.attributes.each do |key,value|
                print "#{key}: #{value} "
                puts  
            end
            loop do
                system('clear')
                client_update = Client.find(client_id)
                client_update.attributes.each do |key,value|
                print "#{key}: #{value} "
                puts  
                end
                puts
                puts 'Campos a actualizar:'
                puts '1 - client_name'
                puts '2 - client_last_name'
                puts '3 - client_rif'
                puts '4 - client_address'
                puts '5 - client_email'
                puts '6 - client_phone'
                puts '7 - actualizar saldo'
                puts 'r - revisar cambios'
                puts '+++++++++++++++++++++++'
                puts 'd - eliminar cliente'
                puts 'x - para salir'
        
                selector = gets.chomp.to_s
        
                case selector
                    when '1'
                        puts 'Ingrese nuevo nombre del cliente ej: Pedro'
                        client_name = gets.chomp.to_s
                        client_hash = {client_name: client_name}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '2'
                        puts 'Ingrese nuevo apellido del cliente ej: Martinez'
                        client_last_name = gets.chomp.to_s
                        client_hash = {client_last_name: client_last_name}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '3'
                        puts 'Ingrese nuevo rif del cliente ej: V-28180709'
                        client_rif = gets.chomp.to_s
                        client_hash = {client_rif: client_rif}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '4'
                        puts 'Ingrese nueva direccion del cliente ej: Manzanares'
                        client_address = gets.chomp.to_s
                        client_hash = {client_address: client_address}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '5'
                        puts 'Ingrese nuevo correo electronico del cliente ej: cliente@email.com'
                        client_email = gets.chomp.to_s
                        client_hash = {client_email: client_email}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '6'
                        puts 'Ingrese nuevo telefono del cliente ej: 0424-2225889'
                        client_phone = gets.chomp.to_s
                        client_hash = {client_phone: client_phone}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when '7'  
                        puts 'Ingrese el saldo actualizado del cliente ej: 900, saldo positivos mayores a 0'
                        client_balance = gets.chomp.to_d
                        if client_balance >= 1000
                            client_balance = client_balance * 1.02
                            puts
                            puts 'Carga >= 1000. Felicidades, bono de 2% a su actualizacion'
                            puts
                        end
                        client_hash = {client_balance: client_balance}
                        Client.update(client_id, client_hash)
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when 'r'
                        system('clear')
                        client_update.attributes.each do |key,value|
                        print "#{key}: #{value} "
                        puts  
                        end
                        puts 'Presione cualquier tecla para continuar'
                        continuator = gets.chomp
                    when 'd'
                        puts
                        client_update.attributes.each do |key,value|
                        print "#{key}: #{value} "
                        puts  
                        end
                        puts
                        puts 'y/n para confirmar eliminar cliente'
                        selector = gets.chomp
                        while selector != 'y' && selector != 'n'
                            puts 'y/n para confirmar eliminar cliente'
                            selector = gets.chomp
                        end
                        if selector == 'y'
                            client_update.destroy
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