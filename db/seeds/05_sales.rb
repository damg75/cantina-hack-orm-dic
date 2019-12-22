require_relative '../../models/client'
require_relative '../../models/invoice'
require_relative '../../models/product'
require_relative '../../models/sale'

puts 'Creating Sales'

#Clientes

kharl  = Client.find_by(client_name: 'Kharl')
pablo  = Client.find_by(client_name: 'Pablo')
yojara = Client.find_by(client_address: 'El Marques')
bob    = Client.find_by(client_name: 'Bob')
pedro  = Client.find_by(client_last_name: 'Pedrito')

kharl_invoice  = Invoice.find_by(client_id: kharl.id)
pablo_invoice  = Invoice.find_by(client_id: pablo.id)
yojara_invoice = Invoice.find_by(client_id: yojara.id)
bob_invoice    = Invoice.find_by(client_id: bob.id)
pedro_invoice  = Invoice.find_by(client_id: pedro.id)

#Products

shawarmadecarne = Product.find_by(product_name: 'Shawarma de Carne')
shawarmadepollo = Product.find_by(product_name: 'Shawarma de Pollo')
shawarmamixto   = Product.find_by(product_name: 'Shawarma Mixto')
kebabdepollo    = Product.find_by(product_name: 'Kebab de Pollo')
kebabdecarne    = Product.find_by(product_name: 'Kebab de Carne')
kebabmixto      = Product.find_by(product_name: 'Kebab Mixto')
cocacola        = Product.find_by(product_name: 'Coca Cola')
papasfritas     = Product.find_by(product_name: 'Papas Fritas')
tabule          = Product.find_by(product_name: 'Tabule')

sales_list = [
    {sale_quantity: 1, sale_price: shawarmadecarne.selling_price, invoice_id: kharl_invoice.id , product_id: shawarmadecarne.id},
    {sale_quantity: 1, sale_price: kebabdepollo.selling_price, invoice_id: kharl_invoice.id , product_id: kebabdepollo.id},
    {sale_quantity: 1, sale_price: cocacola.selling_price, invoice_id: kharl_invoice.id , product_id: cocacola.id},
    {sale_quantity: 1, sale_price: shawarmadepollo.selling_price, invoice_id: pablo_invoice.id , product_id: shawarmadepollo.id},
    {sale_quantity: 1, sale_price: papasfritas.selling_price, invoice_id: pablo_invoice.id , product_id: papasfritas.id},
    {sale_quantity: 1, sale_price: cocacola.selling_price, invoice_id: pablo_invoice.id , product_id: cocacola.id},
    {sale_quantity: 1, sale_price: kebabmixto.selling_price, invoice_id: yojara_invoice.id , product_id: kebabmixto.id},
    {sale_quantity: 1, sale_price: tabule.selling_price, invoice_id: yojara_invoice.id , product_id: tabule.id},
    {sale_quantity: 1, sale_price: cocacola.selling_price, invoice_id: yojara_invoice.id , product_id: cocacola.id},
    {sale_quantity: 1, sale_price: kebabdecarne.selling_price, invoice_id: bob_invoice.id , product_id: kebabdecarne.id},
    {sale_quantity: 1, sale_price: kebabdepollo.selling_price, invoice_id: bob_invoice.id , product_id: kebabdepollo.id},
    {sale_quantity: 1, sale_price: papasfritas.selling_price, invoice_id: bob_invoice.id , product_id: papasfritas.id},
    {sale_quantity: 1, sale_price: cocacola.selling_price, invoice_id: bob_invoice.id , product_id: cocacola.id},
    {sale_quantity: 1, sale_price: kebabmixto.selling_price, invoice_id: pedro_invoice.id , product_id: kebabmixto.id},
    {sale_quantity: 1, sale_price: papasfritas.selling_price, invoice_id: pedro_invoice.id , product_id: papasfritas.id},
    {sale_quantity: 1, sale_price: tabule.selling_price, invoice_id: pedro_invoice.id , product_id: tabule.id},
    {sale_quantity: 1, sale_price: cocacola.selling_price, invoice_id: pedro_invoice.id , product_id: cocacola.id}
]

sales_list.each do |sale_hash|
    Sale.find_or_create_by(sale_hash)
end

puts
puts 'sales list:'
puts
sales = []
Sale.all.each do |sale|
    sales << sale
end
sales.each do |sale|
    puts
    sale.attributes.each do |key, value|
    print "#{key}: #{value} "
    end
    puts
end

puts
puts "Sales creation finished. There are #{Sale.count} Sales registered in the database"
