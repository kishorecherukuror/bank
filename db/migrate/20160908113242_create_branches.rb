class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :area
      t.string :ifsc

      t.timestamps null: false
    end
  end
end
