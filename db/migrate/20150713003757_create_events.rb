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
      t.string :address
      t.string :city
      t.string :state
      t.string :state_code
      t.string :postal_code
      t.string :country
      t.string :country_code
      t.string :web_formatted_address
      t.string :hare
      t.string :hare_contact_number

      t.timestamps
    end
    add_index :events, [:hash_kennel_id, :date]
    add_index :events, :date
  end
end
