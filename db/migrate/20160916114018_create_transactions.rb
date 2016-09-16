class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.integer :amount
      t.date :trasaction_date
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
