class CreateHashKennels < ActiveRecord::Migration
  def change
    create_table :hash_kennels do |t|
      t.string :full_name
      t.string :abbreviation
      t.string :description
      t.string :region
      t.boolean :allow_rego?
      t.datetime :founding
      t.timestamps
    end

    add_index(:hash_kennels, :abbreviation, unique: true)
  end
end
