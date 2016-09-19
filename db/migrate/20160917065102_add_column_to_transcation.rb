class AddColumnToTranscation < ActiveRecord::Migration[5.0]
  def change
    add_column :transcations, :account_id, :integer
  end
end
