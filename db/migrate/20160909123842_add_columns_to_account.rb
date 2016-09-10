class AddColumnsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :amount, :integer
  end
end
