json.extract! product, :id, :name, :image_url, :price, :quantity, :warranty, :created_at, :updated_at
json.url product_url(product, format: :json)
