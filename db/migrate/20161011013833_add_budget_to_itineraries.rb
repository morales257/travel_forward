class AddBudgetToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :budget, :integer, default: 0
  end
end
