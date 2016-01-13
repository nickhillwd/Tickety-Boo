class Event < ActiveRecord::Base

  belongs_to :act
  belongs_to :venue
  belongs_to :feature
  has_many :bookings
  has_many :users, :through => :bookings
  has_many :event_genres
  has_many :genres, :through => :event_genres

  def self.search(search)
    where("event_details LIKE ?", "%#{search}%")
  end

  def double_booking?
    self.venue.events.each do |event|
      if event == self
        next
      end
      range = (event.event_start_time.to_i .. event.event_end_time.to_i)
      if (range) === self.event_start_time.to_i
        return "Event already Booked at this Time at this Venue"
      elsif (range) === self.event_end_time.to_i
        return "Event already Booked at this Time at this Venue"
      end
    end
    return nil
  end

  def tickets_left?
    event = Event.find(self.id)
    booking_count = event.bookings.count
    tickets_left = event.venue.venue_capacity - booking_count
  end

  def sold_out?
    event = Event.find(self.id)
    booking_count = event.bookings.count
    tickets_left = event.venue.venue_capacity - booking_count
    if tickets_left >= event.venue.venue_capacity
      return true
    else
      return false
    end
  end

end
