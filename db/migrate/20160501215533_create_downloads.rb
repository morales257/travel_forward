class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :downloader_id
      t.integer :downloaded_id

      t.timestamps null: false
    end

    add_index :downloads, :downloader_id
    add_index :downloads, :downloaded_id
    #add uniqueness to ensure user can only download each itinerary once
    add_index :downloads, [:downloader_id, :downloaded_id], unique: true
  end
end
