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
categories_types = ActiveSupport::JSON.decode(File.read('db/seeds/categories_types.json'))

categories.each do |category|
	Category.create!(name: category['name'], category_id: category['categoryId'])
end

types.each do |type|
	Type.create!(name: type['name'], type_id: type['typeId'])
end

products.each_with_index do |product, index|
	Product.create!(name: product['name'], image: "https://www.phongcachxanh.vn" + product['imgUrl'],
	price: product['price'].to_i * 1000000, quantity: '100',
	warranty: product['warranty'], active: true, category_id: product['categoryId'])
	if product['types']
			pro = Product.find(index + 1)
			product['types'].each do |id|
					pro.types << Type.find(id)
			end
	end
end

categories_types.each do |item|
	cate = Category.find_by_id(item['cateId'])
	item['typeIds'].each do |id|
		cate.types << Type.find(id)
	end
end

#data order status
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
