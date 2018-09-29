# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ActiveSupport::JSON.decode(File.read('db/seeds/categories.json'))
types = ActiveSupport::JSON.decode(File.read('db/seeds/types.json'))
products = ActiveSupport::JSON.decode(File.read('db/seeds/products_keyboard.json'))

categories.each do |category|
    Category.create!(name: category['name'], category_id: category['categoryId'])
end

types.each do |type|
    Type.create!(name: type['name'], type_id: type['typeId'])
end
products.each_with_index do |product, index|
    Product.create!(name: product['name'], image_url: product['imgUrl'],
    price: product['price'], quantity: '100',
    warranty: product['warranty'], category_id: product['categoryId'])
    if product['types']
        pro = Product.find(index + 1)
        product['types'].each do |id|
            pro.types << Type.find(id)
        end
    end
end
