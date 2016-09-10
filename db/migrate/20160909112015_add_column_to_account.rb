class AddColumnToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :branch_id, :integer
  end
end
