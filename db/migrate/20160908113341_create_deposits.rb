class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.integer :amount
      t.string :dep_date

      t.timestamps null: false
    end
  end
end
