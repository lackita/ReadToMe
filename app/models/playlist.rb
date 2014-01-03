class Playlist < ActiveRecord::Base
  attr_accessible :name
  has_many :playlist_items
  has_attached_file :mp3
end
