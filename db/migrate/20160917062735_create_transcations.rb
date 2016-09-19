class CreateTranscations < ActiveRecord::Migration[5.0]
  def change
    create_table :transcations do |t|
      t.string :transcation_type
      t.integer :transaction_id
      t.date :transcation_date

      t.timestamps
    end
  end
end
