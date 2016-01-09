class Event < ActiveRecord::Base

  belongs_to :genre
  belongs_to :review
  belongs_to :act
  belongs_to :venue
  has_many :bookings

end
