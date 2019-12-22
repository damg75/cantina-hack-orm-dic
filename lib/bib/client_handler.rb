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
            puts 'estoy en el client handler'
            Client_handler.input_handler
        end
    end
    
    def self.input_handler
        selector = gets.chomp
        case selector
            when 'q'
                puts
                puts 'clients list:'
                puts
                array = []
                Client.all.each do |i|
                    array << i
                end
                array.each do |i|
                    puts
                    i.attributes.each do |key, value|
                    print "#{key}: #{value} "
                    end
                    puts
                end
                puts
                puts 'Presione cualquier tecla para continuar'
                continuator = gets.chomp
            when 'x'
                Client_handler.exit_client_handler
        end
    end

    def self.exit_client_handler
        raise StopIteration
    end
end