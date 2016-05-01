class Review < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :user
  validates :rating, presence: true, numericality: {only_integer: true}
  validates :comment, presence: true
end
