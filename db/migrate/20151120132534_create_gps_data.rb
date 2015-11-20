class CreateGpsData < ActiveRecord::Migration
  def change
    create_table :gps_data do |t|
      t.belongs_to :event, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.json :data
      t.string :file_location, null: false
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :gps_data, [:event_id, :user_id]
    add_index :gps_data, :status
  end
end
