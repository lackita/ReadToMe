class CreatePlaylistItems < ActiveRecord::Migration
  def change
    create_table :playlist_items do |t|
      t.integer :playlist_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end
