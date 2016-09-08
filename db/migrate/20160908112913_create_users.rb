class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :ful_name
      t.string :email
      t.integer :age
      t.text :address
      t.string :gender

      t.timestamps null: false
    end
  end
end
