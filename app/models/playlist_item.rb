class PlaylistItem < ActiveRecord::Base
  attr_accessible :chapter_id, :playlist_id
  belongs_to :playlist
  belongs_to :chapter
end
