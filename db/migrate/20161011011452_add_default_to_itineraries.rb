class AddDefaultToItineraries < ActiveRecord::Migration
  def change
    change_column_default :itineraries, :budget, to: 0
  end
end
