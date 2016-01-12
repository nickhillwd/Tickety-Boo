class EventsController < ApplicationController
  
  def index
    
    @genres = Genre.all
    @events = Event.all
    # binding.pry

  end

  def show
    
    @event = Event.find(params[:id])
    
  end

end
