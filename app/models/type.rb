class Type < ApplicationRecord
    has_and_belongs_to_many :products, :join_table => "products_types"
    has_and_belongs_to_many :categories, :join_table => "categories_types"
    has_many :types
end
