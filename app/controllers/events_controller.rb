class EventsController < ApplicationController
  
  def index
    @genre = Genre.all
    @events = Event.all
  end

end
