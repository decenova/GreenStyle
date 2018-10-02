class Type < ApplicationRecord
    has_and_belongs_to_many :products, :join_table => "products_types"
    has_many :subtypes, :class_name => "Type", :foreign_key => "type_id"
    belongs_to :parent_type, :class_name => "Type"
end
