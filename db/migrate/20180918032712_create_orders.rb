class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_cost
      t.datetime :order_date
      t.string :status
      t.belongs_to :user

      t.timestamps
    end
  end
end
