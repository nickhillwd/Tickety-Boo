class Booking < ActiveRecord::Base

  belongs_to :event, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many :venues, :through => :event
  has_many :acts, :through => :event
  has_many :genres, :through => :event

  scope :unpaid, -> {where(:paid => nil)}

  def self.unpaid_grouped_events
    Booking.unpaid.group("event_id")
  end

end
