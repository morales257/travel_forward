class AddGeocodeToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :latitude, :float
    add_column :itineraries, :longitude, :float
  end
end
