class Venue < ActiveRecord::Base

  belongs_to :event
  has_many :events
  has_many :acts, :through => :event
  has_many :bookings, :through => :event

  def self.search(search)
    by_location = where("venue_location LIKE ?", "%#{search}%")
    by_name = where("venue_name LIKE ?", "%#{search}%")
    (by_location + by_name).uniq
  end

end
