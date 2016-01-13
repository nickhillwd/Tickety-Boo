class VenuesController < ApplicationController
  
  def index
   
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    venue = Venue.find(params[:id])
    venue.update(venue_params)
    redirect_to admin_index_path
  end

  def new
    @venue = Venue.new
  end

  def create
    venue_new = Event.new(venue_params)
    venue_new.save
    redirect_to admin_index_path
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def all_events
    @venue = Venue.find(params[:id])
  end

  private

  def venue_params
    params.require(:venue).permit(:venue_name, :venue_location, :venue_capacity)
  end

end
