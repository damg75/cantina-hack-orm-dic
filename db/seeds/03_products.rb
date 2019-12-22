require_relative '../../models/category'
require_relative '../../models/product'


puts 'Creating Products'

shawarma = Category.find_by(category_name: 'Shawarma')
kebab    = Category.find_by(category_name: 'Kebab')
otros    = Category.find_by(category_name: 'Otros')

products_list = [
    {product_name: 'Shawarma de Carne', product_description: 'Shawarma solo de carne', product_quantity: 10, selling_price: 10, category_id: shawarma.id},
    {product_name: 'Shawarma de Pollo', product_description: 'Shawarma solo de Pollo', product_quantity: 10, selling_price: 10, category_id: shawarma.id},
    {product_name: 'Shawarma Mixto', product_description: 'Shawarma de Carne y Pollo', product_quantity: 10, selling_price: 12, category_id: shawarma.id},
    {product_name: 'Kebab de Pollo', product_description: 'Kebab de Pollo', product_quantity: 20, selling_price: 20, category_id: kebab.id},
    {product_name: 'Kebab de Carne', product_description: 'Kebab de Carne', product_quantity: 20, selling_price: 20, category_id: kebab.id},
    {product_name: 'Kebab Mixto', product_description: 'Kebab Mixto', product_quantity: 20, selling_price: 24, category_id: kebab.id},
    {product_name: 'Coca Cola', product_description: 'Refresco', product_quantity: 30, selling_price: 5, category_id: otros.id},
    {product_name: 'Papas Fritas', product_description: 'Racion de papas fritas', product_quantity: 50, selling_price: 6, category_id: otros.id},
    {product_name: 'Tabule', product_description: 'Tabule', product_quantity: 40, selling_price: 3, category_id: otros.id}
]


products_list.each do |product_hash|
    Product.find_or_create_by(product_hash)
end

puts
puts 'products list:'
puts
products = []
Product.all.each do |product|
    products << product
end
products.each do |product|
    puts
    product.attributes.each do |key, value|
    print "#{key}: #{value} "
    end
    puts
end

puts
puts "Products creation finished. There are #{Product.count} Products registered in the database"
