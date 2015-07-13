class CreateHashKennels < ActiveRecord::Migration
  def change
    create_table :hash_kennels do |t|
      t.string :full_name
      t.string :abbreviation
      t.string :description
      t.string :region
      t.datetime :founding
      t.timestamps
    end
  end
end
