class Download < ActiveRecord::Base
#  has_attached_file :document, styles: { medium: ["165x210#", :jpg]}
#  validates_attachment_presence :document
#  validates_attachment_content_type :document, content_type: ['application/pdf']

  #establish the user as the downloader
  belongs_to :downloader, class_name: "User"
  belongs_to :downloaded, class_name: "Itinerary"

  validates :downloader_id, presence: true
  validates :downloaded_id, presence: true
end
