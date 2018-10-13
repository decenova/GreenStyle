class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
<<<<<<< HEAD
=======
      t.string :username
>>>>>>> ca6db7c9c35446d8cf6b2e46f0e413faf6eda925
      t.string :email
      t.string :name
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
