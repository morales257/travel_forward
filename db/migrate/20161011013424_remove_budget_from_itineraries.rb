class RemoveBudgetFromItineraries < ActiveRecord::Migration
  def change
    remove_column :itineraries, :budget, :integer
  end
end
