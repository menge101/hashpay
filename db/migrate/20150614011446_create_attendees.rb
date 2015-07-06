class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :kennel
      t.string :email
      t.timestamps
    end
  end
end
