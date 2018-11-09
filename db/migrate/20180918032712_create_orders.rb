class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.string :status
      t.belongs_to :user

      t.timestamps
    end
  end
end
