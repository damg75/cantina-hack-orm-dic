# def tablero_f
#   tablero = []
#  for i in 0..3 do
#   tablero[i] = []
#   for j in 0..3 do
#     if i==0 then
#         if j==0 then
#          tablero[0][0]=1
#         else 
#             tablero[i][j] = tablero[i-1][j-1]+1  
#         end      
#     end
#     if i==1
#         if j==0
#          tablero[1][0] = tablero[0][3]+1
#         else
#          tablero[i][j] = tablero[i-1+1][j-1+1]+1 
#         end
#     end     


#   end
#  end
# return tablero
# end

# def print_f(tablero)
#  for i in 0..3 do
#     p tablero[i]
#  end 
# end   

# tablero=tablero_f
# print_f(tablero)

# def abecedario_f 
#   abecedario='abcdefghijklmnopqrstuvwxyz'
#   k=0
#   tablero = []
#  for i in 0..1 do
#   tablero[i] = []
#   for j in 0..12 do
#     tablero[i][j] = abecedario[k]
#     k += 1
#   end
#  end
#  return tablero
# end 

# tablero=abecedario_f

# for i in 0..1 do
#  p tablero[i]
# end 

# arreglo=[]
# for i in 0..15 do
#     if i==0 then
#         arreglo[0]=1
#     end    
#     if i>0 then
#         arreglo[i]=arreglo[i-1]+1
#     end  
# end          
# tablero = []
# for i in 0..0 do
#     tablero=[]
#     for j in 0..3 do
#         tablero[i][j]=arreglo[j]
#     end
# end    
# p tablero

#Funcion si un texto dado es palindromo o no

# def palindromo_f
#  p 'ingrese texto'
#  texto=gets.chomp
#  textoi=[]
#  for i in 0...texto.length do
#     textoi[i]=texto[i]
#  end   
#  reverso_texto=[]
#  palindromo=false
#  for i in 0...textoi.length
#     reverso_texto[i]=textoi[textoi.length-1-i]
#  end
#   p reverso_texto    

#  if textoi==reverso_texto then
#     palindromo=true
#  end  
#  return palindromo
# end 

# palindromo=palindromo_f
# p palindromo

#Escriba una funciono procedimiento que genere un arreglo de entero dada una longitud sin repetidos


# p 'ingrese longitud de arreglo'
# l=gets.chomp.to_i
# arreglo=[]
# descartados=[]
# arreglo[0]=rand(10)
# for i in 1...l do
#     num=rand(15)
#     for j in 0...arreglo.length do
#        while num==arreglo[j]
#           descartados<<num
#           for k in 0...descartados.length do

            
#        end
#     end 
#     arreglo[i]=num
# end    
# p arreglo

#matriz[o].length columnas de la matriz

#Escriba un programa en Ruby, usando procedimientos y/o funciones, que reciba una matriz de enteros y 
#devuelva un arreglo que contenga la columna de la matriz cuya sumatoria de elementos es la máxima de la matriz. Ej.
#Entrada:
tablero=[]
for i in 0..5 do
    tablero[i]=[]
        for j in 0..5 do
            tablero[i][j]=rand(20)
        end
end  
for i in 0..5 do  
p tablero[i]
end

# def columna_maxima_f(tablero)
sumas=[]
suma=0
j=0
while j<=tablero[0].length
    for i in 0..tablero.length
        suma=tablero[i][j]+suma
    end  
 sumas<<suma
 j+=1
end   
max=0
for i in 0..sumas.length
    if sumas[i]>max then
        suma[i]=max
    end
end
k=0
    while k<=sumas.length
        if sumas[k]=max then
            columna_maxima=k
        end
    k+=1
    end
columna_maxima_vector=[]
for i in 0..tablero.length
    columna_maxima_vector<<tablero[i][columna_maxima]
end
# return columna_maxima_vector    
# end

# columna_maxima=columna_maxima_f(tablero)
p columna_maxima




 