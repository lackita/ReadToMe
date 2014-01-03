class AddMp3ToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :mp3_file_name, :string
    add_column :playlists, :mp3_content_type, :string
    add_column :playlists, :mp3_file_size, :integer
    add_column :playlists, :mp3_updated_at, :datetime
  end
end
