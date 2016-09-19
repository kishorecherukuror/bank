class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :address

      t.timestamps
    end
  end
end
