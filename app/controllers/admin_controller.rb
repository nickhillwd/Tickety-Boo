class AdminController < ApplicationController
  
  def index
    @events = Event.all
    @venues = Venue.all
    @bookings = Booking.all
    @users = User.all
    @acts = Act.all
    @featured = Feature.all
  end

end
