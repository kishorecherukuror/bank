class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account_id
      t.string :account_type

      t.timestamps
    end
  end
end
