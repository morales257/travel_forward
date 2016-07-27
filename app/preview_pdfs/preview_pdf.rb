class PreviewPDF < Prawn::Document

  def initialize(itinerary)
    #run initialize method from the super class
    super()
    @itin_preview = itinerary
    reader = PDF::Reader.new("public/#{@itin_preview.document_file_name}")
    formatted_page = reader.page(1)
    formatted_text = formatted_page.text.gsub! /\s+/, ''
    page_text = formatted_text.gsub!(/$/, "\n")
    #content = page.text

    #text "#{content}"
    text page_text, :align => :left

  end
end
