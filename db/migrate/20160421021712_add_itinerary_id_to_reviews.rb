class AddItineraryIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :itinerary_id, :integer
  end
end
