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
    @event = Event.find(params[:id])
    @acts = Act.all
    @venues = Venue.all
  end

  def update
    event = Event.find(params[:id])
    double_booking = event.double_booking?
    if double_booking
      redirect_to edit_event_path(event.id), alert: ("Fail: #{double_booking}")
      return
    end
    event.update(event_params)
    redirect_to admin_index_path
  end

  def new
    @event = Event.new
    @acts = Act.all
    @venues = Venue.all
  end

  def create
    event_new = Event.new(event_params)
    double_booking = event_new.double_booking?
    if double_booking
      redirect_to new_event_path, alert: ("Fail: #{double_booking}")
      return
    end
    event_new.save
    redirect_to admin_index_path
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

  private

    def event_params
      params.require(:event).permit(:event_details, :event_price, :act_id, :venue_id, :event_start_time, :event_end_time)
    end

end
