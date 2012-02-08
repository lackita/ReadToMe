class Book < ActiveRecord::Base
  has_many :chapter
end
