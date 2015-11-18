class CreateKennels < ActiveRecord::Migration
  def change
    create_table :kennels do |t|
      t.string :full_name
      t.string :abbreviation
      t.string :description
      t.string :region
      t.boolean :allow_rego?
      t.string :facebook_url
      t.datetime :founding
      t.timestamps
    end
  end
end
