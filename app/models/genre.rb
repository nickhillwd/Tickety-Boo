class Genre < ActiveRecord::Base
  has_many :event_genres
  has_many :events, :through => :event_genres
end
