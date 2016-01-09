class Booking < ActiveRecord::Base

  belongs_to :event
  belongs_to :user
  has_many :venues, :through => :event
  has_many :acts, :through => :event
  has_many :genres, :through => :event

end
