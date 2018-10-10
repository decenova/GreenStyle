class CreateJoinTableCategoriesTypes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :types do |t|
      t.index [:category_id, :type_id]
      t.index [:type_id, :category_id]
    end
  end
end
