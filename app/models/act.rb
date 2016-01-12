class Act < ActiveRecord::Base

  belongs_to :event
  has_many :events
  has_many :venues, :through => :event
  has_many :bookings, :through => :event
  has_many :genres, :through => :event

  def self.search(search)
    where("act_name LIKE ?", "%#{search}%")
  end

end
