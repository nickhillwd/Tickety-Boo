class BookingsController < ApplicationController

  load_and_authorize_resource

  def new
    @event = Event.find_by(params[:id])
  end

end
