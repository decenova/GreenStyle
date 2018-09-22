class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name
      t.string :super_id
      t.string :integer

      t.timestamps
    end
  end
end
