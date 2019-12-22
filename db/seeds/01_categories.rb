require_relative '../../models/category'

puts 'Creating Categories'

categories_list = [{ category_name: 'Shawarma' }, { category_name: 'Kebab' }, { category_name: 'Otros' }]

categories_list.each do |category_hash|
Category.find_or_create_by(category_hash)
end

puts
puts 'categories list:'
puts
categories = []
Category.all.each do |category|
    categories << category
end
categories.each do |category|
    puts
    category.attributes.each do |key, value|
    print "#{key}: #{value} "
    end
    puts
end

puts
puts "Categories creation finished. There are #{Category.count} Categories registered in the database"
