class Chapter < ActiveRecord::Base
  belongs_to :book
  has_attached_file :track
end
