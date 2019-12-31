require_relative '../db/connection'
require_relative '../models/category'
require_relative '../models/client'
require_relative '../models/invoice'
require_relative '../models/product'
require_relative '../models/sale'
require_relative 'bib/draw'
require_relative 'bib/client_handler'
require_relative 'bib/product_handler'
require_relative 'bib/shopping_handler'
require 'colorize'

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
            when 'w'
                Product_handler.handler
            when 's'
                Shopping_handler.handler
        end
    end

    def exit_shawarma
        puts "¡Gracias por su visita!".colorize(:red)
        puts "Esperemos que visite pronto otra vez los shawarma... o no".colorize(:green)
        raise StopIteration
    end



end

Main.start