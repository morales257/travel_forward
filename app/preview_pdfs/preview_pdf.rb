class PreviewPDF < Prawn::Document

  def initialize(itinerary)
    super()
    @itinerary = itinerary
    reader = PDF::Reader.new("public/#{@itinerary.document_file_name}")
    page = reader.page(1)
    content = page.text

    text "#{content}"

  end
end
