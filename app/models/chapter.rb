require 'taglib'

class Chapter < ActiveRecord::Base
  belongs_to :book
  has_attached_file :track
  before_save :update_audio_metadata

  def update_audio_metadata
    TagLib::FileRef.open(track.queued_for_write[:original].path) do |mp3|
      self.track_length = mp3.audio_properties.length / 60
    end
  end
end
