class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.string :warranty
      t.boolean :active

      t.belongs_to :category

      t.timestamps
    end
  end
end
