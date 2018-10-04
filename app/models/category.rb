class Category < ApplicationRecord
    has_many :products
    has_many :categories
    has_and_belongs_to_many :types, :join_table => "categories_types"
    scope :parent_cate, -> {where(category_id: nil)}
end
