class AddCreditsToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :credit_cost, :integer
  end
end
