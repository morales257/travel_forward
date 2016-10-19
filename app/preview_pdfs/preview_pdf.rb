require 'open-uri'
class PreviewPDF < Prawn::Document

  def initialize(itinerary)
    #run initialize method from the super class
    super()
    @itin_preview = itinerary
    io = open(APP_CONFIG[Rails.env]['itinerary_path'])
    reader = PDF::Reader.new(io)
    formatted_page = reader.page(1)
    formatted_text = formatted_page.text.gsub! /\s+/, ''
    page_text = formatted_text.gsub!(/$/, "\n")
    #content = page.text

    #text "#{content}"
    text page_text, :align => :left
  end

end
