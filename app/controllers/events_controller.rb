class EventsController < ApplicationController
  
  def index
    
    @genres = Genre.all
    @events = Event.all
    @bookings = Booking.all

  end

  def show
    
    @event = Event.find(params[:id])
    
  end

end
