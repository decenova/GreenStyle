class Product < ApplicationRecord
    has_and_belongs_to_many :types, :join_table => "products_types"
end
