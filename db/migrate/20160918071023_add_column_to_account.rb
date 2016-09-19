class AddColumnToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :amount, :integer
  end
end
