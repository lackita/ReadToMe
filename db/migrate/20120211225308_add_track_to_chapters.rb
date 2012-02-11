class AddTrackToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :track_file_name, :string
    add_column :chapters, :track_content_type, :string
    add_column :chapters, :track_file_size, :integer
    add_column :chapters, :track_updated_at, :datetime
  end
end
