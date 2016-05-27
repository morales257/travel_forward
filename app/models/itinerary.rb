class Itinerary < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :country, presence: true
  validates :locations, presence: true
  validates :trip_duration, presence: true
  validates :budget, presence: true, numericality: { only_integer: true}
  has_attached_file :document, styles: { medium: ["165x210#", :jpg]}
  validates_attachment_presence :document
  validates_attachment_content_type :document, content_type: ['application/pdf']
  after_initialize :set_cost

  #Geocode by country
  geocoded_by :country
  after_validation :geocode

  has_many :reviews

  has_many :downloads, foreign_key: "downloaded_id"
  has_many :downloaders, through: :downloads

  private

  def set_cost
    self.credit_cost ||= 1

  end



end
