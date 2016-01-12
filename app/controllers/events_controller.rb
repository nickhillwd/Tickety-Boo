class EventsController < ApplicationController
  
  def index
    
    @genres = Genre.all
    @events = Event.all
    @bookings = Booking.all

  end

  def show
    
    @event = Event.find(params[:id])
    
  end

  def edit
    
  end

  def search
    
      if params[:search]
        @events = Event.search(params[:search])
        @acts = Act.search(params[:search])#.order("ingredient_name DESC")
        @venues = Venue.search(params[:search])
        @genres = Genre.search(params[:search])
      else
        @event = Event.all.order("event_details DESC")
      end
  end

end
