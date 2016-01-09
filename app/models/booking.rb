class Booking < ActiveRecord::Base

  belongs_to :event, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many :venues, :through => :event
  has_many :acts, :through => :event
  has_many :genres, :through => :event

end
