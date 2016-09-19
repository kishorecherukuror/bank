class RemoveColumnFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :account_id, :string
  end
end
