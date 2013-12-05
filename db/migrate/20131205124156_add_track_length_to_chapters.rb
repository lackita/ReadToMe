class AddTrackLengthToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :track_length, :number
  end
end
