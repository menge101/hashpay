class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :hash_kennel, index: true
      t.string :name
      t.decimal :cost
      t.datetime :date
      t.string :description
      t.string :location
      t.boolean :allow_rego?
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :events, [:hash_kennel_id, :date]
    add_index :events, :date
  end
end
