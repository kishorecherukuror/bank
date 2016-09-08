class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.integer :amount
      t.string :withdraw_date

      t.timestamps null: false
    end
  end
end
