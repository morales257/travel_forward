module ItinerariesHelper
#require "open-uri"
#  def preview(itinerary)
#    file_name = File.open("public/#{itinerary.document_file_name}","rb")
#    page = 1

#    itinerary.previewer(file_name, page)

#  end

#def previewer(itinerary)
#  file_name = File.open("public/#{itinerary.document_file_name}")
#  file = StringIO.new(file_name)
#  reader = PDF::Reader.new(file_name)
#  preview = reader.page(1)

#  puts preview.text

#end
def user_is_reviewer?(review_id)
  if logged_in?
  current_user||= User.find(params[:id])
  review = Review.find(review_id)
  current_user.id == review.user_id
  end
end

def avg_review(itin)
  if itin.reviews.blank?
    0
  else
    itin.reviews.average(:rating).round(2)
  end
end


end
