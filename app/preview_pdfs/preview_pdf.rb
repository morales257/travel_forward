require 'open-uri'
class PreviewPDF < Prawn::Document

  def initialize(itinerary)
    #run initialize method from the super class
    super()
    @itin_preview = itinerary
    io = open('https://s3-us-west-2.amazonaws.com/travelforwardapp/itineraries/documents/000/000/007/original/Joe_Wehinger_Report_-_Week_2.pdf')
    reader = PDF::Reader.new(io)
    formatted_page = reader.page(1)
    formatted_text = formatted_page.text.gsub! /\s+/, ''
    page_text = formatted_text.gsub!(/$/, "\n")
    #content = page.text

    #text "#{content}"
    text page_text, :align => :left
  end

end
