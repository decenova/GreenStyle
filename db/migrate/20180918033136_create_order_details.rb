class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.decimal :price
      t.integer :quantity
      t.decimal :total_price

      t.belongs_to :order
      t.belongs_to :product
      t.timestamps
    end
  end
end
