class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :kennel, index: true
      t.string :first_name
      t.string :last_name
      t.string :hash_name

      t.timestamps
    end
  end
end
