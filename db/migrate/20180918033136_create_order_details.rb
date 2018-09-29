class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.decimal :price
      t.belongs_to :order

      t.timestamps
    end
  end
end
