class PreviewPDF < Prawn::Document

  def initialize(itinerary)
    #run initialize method from the super class
    super()
    @itin_preview = itinerary
    reader = PDF::Reader.new("public/#{@itin_preview.document_file_name}")
    page = reader.page(1)
    #content = page.text

    #text "#{content}"
    text page.text, :align => :left

  end
end
