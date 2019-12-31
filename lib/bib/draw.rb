require 'colorize'

class Draw
    
    def self.main_menu
        system('clear')
        puts
        puts '                                                                                                         
        #######      /                                                                                     
      /       ###  #/                                                                                      
     /         ##  ##                                                                                      
     ##        #   ##                 ##                                                                   
      ###          ##                 ##                                                                   
     ## ###        ##  /##      /###   ##    ###    ####      /###   ###  /###   ### /### /###     /###    
      ### ###      ## / ###    / ###  / ##    ###     ###  / / ###  / ###/ #### / ##/ ###/ /##  / / ###  / 
        ### ###    ##/   ###  /   ###/  ##     ###     ###/ /   ###/   ##   ###/   ##  ###/ ###/ /   ###/  
          ### /##  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
            #/ /## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
             #/ ## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
              # /  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
    /##        /   ##     ## ##    /#   ##      /#      /  ##    /#    ##          ##   ##   ## ##    /#   
   /  ########/    ##     ##  ####/ ##   ######/ ######/    ####/ ##   ###         ###  ###  ### ####/ ##  
  /     #####       ##    ##   ###   ##   #####   #####      ###   ##   ###         ###  ###  ### ###   ## 
  |                       /                                                                                
   \)                    /                                                                                 
                        /                                                                                  
                       /                                                                                   
  
  '.colorize(:green)
        puts   
        puts '                                               Bienvenido a los Shawarmas'
        puts
    end

    def self.main_menu_sub_menu
        puts 'Opciones de la base de datos:'
        puts 
        puts 'q: Gestion de Clientes'
        puts
        puts 'w: Gestion de Productos'
        puts
        puts 's: Gestion de Compras'
        puts
        puts 'a: Inteligencia del Negocio'
        puts 
        puts 'x: Salir'
        puts
    end
    
    def self.client_handler_menu
        puts 'Gestion de Clientes:'
        puts 
        puts 'q: Lista de clientes/Busqueda de Clientes'
        puts
        puts 'w: Crear/Actualizar/Eliminar un Cliente'
        puts
        puts 'x: Salir al menu anterior'
        puts
    end

    def self.product_handler_menu
        puts 'Gestion de Productos:'
        puts 
        puts 'q: Lista de Productos/Busqueda de Productos'
        puts
        puts 'w: Crear/Actualizar/Eliminar un Producto'
        puts
        puts 'x: Salir al menu anterior'
        puts
    end

    def self.shopping_handler_menu
        puts 'Gestion de Compras:'
        puts 
        puts 's: Gestion de Compras'
        puts
        puts 'x: Salir al menu anterior'
        puts
    end

end

















