require_relative '../../models/client'
require_relative '../../models/invoice'

puts 'Creating Invoices'

kharl  = Client.find_by(client_name: 'Kharl')
pablo  = Client.find_by(client_name: 'Pablo')
yojara = Client.find_by(client_address: 'El Marques')
bob    = Client.find_by(client_name: 'Bob')
pedro  = Client.find_by(client_last_name: 'Pedrito')

invoices = [
    {invoice_date: '2019-11-21', client_id: kharl.id},
    {invoice_date: '2019-11-22', client_id: pablo.id},
    {invoice_date: '2019-11-23', client_id: yojara.id},
    {invoice_date: '2019-11-24', client_id: bob.id},
    {invoice_date: '2019-11-25', client_id: pedro.id}
]

invoices.each do |invoice|
    Invoice.find_or_create_by!(invoice)
end

puts
puts 'invoices list:'
puts
invoices = []
Invoice.all.each do |invoice|
    invoices << invoice
end
invoices.each do |invoice|
    puts
    invoice.attributes.each do |key, value|
    print "#{key}: #{value} "
    end
    puts
end

puts
puts "Invoices creation finished. There are #{Invoice.count} Invoices registered in the database"

