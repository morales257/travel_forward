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


end
