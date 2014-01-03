require 'taglib'

class Chapter < ActiveRecord::Base
  belongs_to :book
  has_attached_file :track
  after_find :update_audio_metadata

  def update_audio_metadata
    if self.track_file_name and not self.track_length
      TagLib::FileRef.open(track.path) do |mp3|
        self.track_length = mp3.audio_properties.length / 60
      end
    end
  end

  def displayed_track_length
    "#{track_length.to_i / 60}:#{(track_length.to_i % 60).to_s.rjust(2, padstr=0.to_s)}"
  end
end
