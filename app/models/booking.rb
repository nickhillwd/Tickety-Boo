class Booking < ActiveRecord::Base

  require 'time'

  belongs_to :event
  belongs_to :user
  has_many :venues, :through => :event
  has_many :acts, :through => :event
  has_many :genres, :through => :event

  scope :unpaid, -> {where(:paid => nil)}
  scope :paid, -> {where(:paid => true)}

  def self.unpaid_grouped_events
    Booking.unpaid.group("event_id")
  end

  def expired?
    (Time.now - 7200) > created_at
  end

  def self.two_hour_bookings
    checkout_bookings = Booking.unpaid
    counter = 0;
    checkout_bookings.each do |booking|
      if booking.expired?
        booking.destroy
        counter += 1
      end
    end
    return counter
  end

end
