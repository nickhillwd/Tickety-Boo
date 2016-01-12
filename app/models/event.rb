class Event < ActiveRecord::Base

  belongs_to :act
  belongs_to :venue
  has_many :bookings
  has_many :users, :through => :bookings
  has_many :event_genres
  has_many :genres, :through => :event_genres

  def self.search(search)
    where("event_details LIKE ?", "%#{search}%")
  end

end
