class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name, null: false
      t.string :hash_name
      t.string :home_kennel
      t.string :email, null: false
      t.string :stripe_token, null: false
      t.boolean :pay_status
      t.timestamps null: false
    end
  end
end
