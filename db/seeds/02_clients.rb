require_relative '../../models/client'

puts 'Creating Clients'

clients_list = [
    {client_name: 'Kharl', client_last_name: 'Cabrera', client_rif: 'J-8754627', client_address: 'Un lugar con jardin', client_email: 'kharlcabrera@gmail.com', client_phone: '04245876428', client_balance: 1000},
    {client_name: 'Pablo', client_last_name: 'Nose', client_rif: 'J-9876541', client_address: 'En la tienda', client_email: 'pablo@gmail.com', client_phone: '04149856414', client_balance: 1100},
    {client_name: 'Yojara', client_last_name: 'Ehnedi', client_rif: 'J-7842518', client_address: 'El Marques', client_email: 'yojara@gmail.com', client_phone: '04268549632', client_balance: 100},
    {client_name: 'Bob', client_last_name: 'Esponja', client_rif: 'J-8741568', client_address: 'Fondo de bikini', client_email: 'esponja@gmail.com', client_phone: '04246985324', client_balance: 500},
    {client_name: 'Pedro', client_last_name: 'Pedrito', client_rif: 'J-7458126', client_address: 'Susys Cookies', client_email: 'pedro@gmail.com', client_phone: '04268749569', client_balance: 2000}
]



clients_list.each do |client_hash|
    Client.find_or_create_by(client_hash)
end

puts
puts 'clients list:'
puts
clients = []
Client.all.each do |client|
    clients << client
end
clients.each do |client|
    puts
    client.attributes.each do |key, value|
    print "#{key}: #{value} "
    end
    puts
end

puts "Clients creation finished. There are #{Client.count} Clients registered in the database"
