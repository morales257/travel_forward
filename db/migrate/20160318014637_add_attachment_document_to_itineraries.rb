class AddAttachmentDocumentToItineraries < ActiveRecord::Migration
  def self.up
    change_table :itineraries do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :itineraries, :document
  end
end
