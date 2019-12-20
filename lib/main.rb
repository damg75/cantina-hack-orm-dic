require_relative '../db/connection'

module Test_sql 
    sql = 'sentencia aquí'
    p ActiveRecord::Base.connection.execute(sql)
end
#Sustituye solo la 'sentencia aquí' por su instrucción SQL