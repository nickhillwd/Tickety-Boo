class Venue < ActiveRecord::Base

  belongs_to :event
  has_many :events
  has_many :acts, :through => :event
  has_many :bookings, :through => :event

  def self.search(search)
    where("venue_location LIKE ?", "%#{search}%")
  end

end
