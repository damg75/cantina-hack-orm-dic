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
        puts 'e: Gestion de Compras'
        puts
        puts 'x: Salir'
        puts
    end
    
    def self.client_handler_menu
        puts 'Gestion de Clientes:'
        puts 
        puts 'q: Lista de clientes/Busqueda de Clientes'
        puts
        puts 'w: Crear/Actualizar un Cliente'
        puts
        puts 'e: Eliminar un Cliente'
        puts
        puts 'x: Salir al menu anterior'
        puts
    end
end

















# def self.main_menu
#     loop do
#         system('clear')
#         puts
#         puts '                                                                                                         
#         #######      /                                                                                     
#       /       ###  #/                                                                                      
#      /         ##  ##                                                                                      
#      ##        #   ##                 ##                                                                   
#       ###          ##                 ##                                                                   
#      ## ###        ##  /##      /###   ##    ###    ####      /###   ###  /###   ### /### /###     /###    
#       ### ###      ## / ###    / ###  / ##    ###     ###  / / ###  / ###/ #### / ##/ ###/ /##  / / ###  / 
#         ### ###    ##/   ###  /   ###/  ##     ###     ###/ /   ###/   ##   ###/   ##  ###/ ###/ /   ###/  
#           ### /##  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#             #/ /## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#              #/ ## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#               # /  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#     /##        /   ##     ## ##    /#   ##      /#      /  ##    /#    ##          ##   ##   ## ##    /#   
#    /  ########/    ##     ##  ####/ ##   ######/ ######/    ####/ ##   ###         ###  ###  ### ####/ ##  
#   /     #####       ##    ##   ###   ##   #####   #####      ###   ##   ###         ###  ###  ### ###   ## 
#   |                       /                                                                                
#    \)                    /                                                                                 
#                         /                                                                                  
#                        /                                                                                   
  
#   '.colorize(:green)
#         puts
#         puts 'Bienvenido a los Shawarmas'
#         puts
#         sleep(1)
#         system('clear')
#         puts
#         puts '                                                                                                         
#         #######      /                                                                                     
#       /       ###  #/                                                                                      
#      /         ##  ##                                                                                      
#      ##        #   ##                 ##                                                                   
#       ###          ##                 ##                                                                   
#      ## ###        ##  /##      /###   ##    ###    ####      /###   ###  /###   ### /### /###     /###    
#       ### ###      ## / ###    / ###  / ##    ###     ###  / / ###  / ###/ #### / ##/ ###/ /##  / / ###  / 
#         ### ###    ##/   ###  /   ###/  ##     ###     ###/ /   ###/   ##   ###/   ##  ###/ ###/ /   ###/  
#           ### /##  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#             #/ /## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#              #/ ## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#               # /  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#     /##        /   ##     ## ##    /#   ##      /#      /  ##    /#    ##          ##   ##   ## ##    /#   
#    /  ########/    ##     ##  ####/ ##   ######/ ######/    ####/ ##   ###         ###  ###  ### ####/ ##  
#   /     #####       ##    ##   ###   ##   #####   #####      ###   ##   ###         ###  ###  ### ###   ## 
#   |                       /                                                                                
#    \)                    /                                                                                 
#                         /                                                                                  
#                        /                                                                                   
  
#   '.colorize(:white)
#         puts
#         puts 'Bienvenido a los Shawarmas'
#         puts
#         sleep(1)
#         system('clear')
#         puts
#         puts '                                                                                                         
#         #######      /                                                                                     
#       /       ###  #/                                                                                      
#      /         ##  ##                                                                                      
#      ##        #   ##                 ##                                                                   
#       ###          ##                 ##                                                                   
#      ## ###        ##  /##      /###   ##    ###    ####      /###   ###  /###   ### /### /###     /###    
#       ### ###      ## / ###    / ###  / ##    ###     ###  / / ###  / ###/ #### / ##/ ###/ /##  / / ###  / 
#         ### ###    ##/   ###  /   ###/  ##     ###     ###/ /   ###/   ##   ###/   ##  ###/ ###/ /   ###/  
#           ### /##  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#             #/ /## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#              #/ ## ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#               # /  ##     ## ##    ##   ##      ##      ## ##    ##    ##          ##   ##   ## ##    ##   
#     /##        /   ##     ## ##    /#   ##      /#      /  ##    /#    ##          ##   ##   ## ##    /#   
#    /  ########/    ##     ##  ####/ ##   ######/ ######/    ####/ ##   ###         ###  ###  ### ####/ ##  
#   /     #####       ##    ##   ###   ##   #####   #####      ###   ##   ###         ###  ###  ### ###   ## 
#   |                       /                                                                                
#    \)                    /                                                                                 
#                         /                                                                                  
#                        /                                                                                   
  
#   '.colorize(:red)
#         puts
#         puts 'Bienvenido a los Shawarmas'
#         puts
#         sleep(1)
#     end
# end