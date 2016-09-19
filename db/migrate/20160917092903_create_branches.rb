class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :area
      t.string :ifsc

      t.timestamps
    end
  end
end
