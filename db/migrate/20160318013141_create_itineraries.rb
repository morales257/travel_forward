class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :country
      t.string :locations
      t.string :trip_duration
      t.integer :budget
      t.text :tip

      t.timestamps null: false
    end
  end
end
