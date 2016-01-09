class Event < ActiveRecord::Base

  belongs_to :genre
  belongs_to :act
  belongs_to :venue
  has_many :bookings
  has_many :users, :through => :bookings

end
