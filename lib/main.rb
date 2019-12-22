require_relative '../db/connection'
require_relative '../models/category'
require_relative '../models/client'
require_relative '../models/invoice'
require_relative '../models/product'
require_relative '../models/sale'
require_relative 'bib/draw'
require_relative 'bib/client_handler'
require 'colorize'


# module Test_sql 
#     sql = 'sentencia aquí'
#     p ActiveRecord::Base.connection.execute(sql)
# end
#Sustituye solo la 'sentencia aquí' por su instrucción SQL

class Main
    
    def self.start
        main = Main.new
        main.update
    end

    def update
        loop do
            Draw.main_menu
            Draw.main_menu_sub_menu
            input_handler
        end
    end
    
    def input_handler
        selector = gets.chomp
        case selector
            when 'x'
                exit_shawarma
            when 'q'
                Client_handler.handler
        end
    end

    def exit_shawarma
        puts "¡Gracias por su visita!".colorize(:red)
        puts "Esperemos que visite pronto otra vez los shawarma... o no".colorize(:green)
        raise StopIteration
    end



end

Main.start