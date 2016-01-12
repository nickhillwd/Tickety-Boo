class AdminController < ApplicationController
  
  def index
    @events = Event.all
    @bookings = Booking.all
    @Users = User.all
    @acts = Act.all
    @venues = Venue.all
  end

end
