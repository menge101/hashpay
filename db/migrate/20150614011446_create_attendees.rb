class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.belongs_to :event, index: true
      t.string :name
      t.string :kennel
      t.string :email
      t.timestamps
    end
  end
end
