class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.decimal :price
      t.integer :quantity
      t.string :warranty
      t.belongs_to :category
      t.belongs_to :order_detail

      t.timestamps
    end
  end
end
