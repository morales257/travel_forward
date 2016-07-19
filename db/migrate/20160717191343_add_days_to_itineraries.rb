class AddDaysToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :trip_in_days, :integer
  end
end
