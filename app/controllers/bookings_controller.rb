class BookingsController < ApplicationController

  load_and_authorize_resource

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
    @ticket_range = (@event.tickets_left? > 6) ? 6 : @event.tickets_left?
  end

  def create

    new_booking = Booking.new(booking_params)
    if new_booking.event.sold_out?
      redirect_to root_path, alert: "Event Sold Out"
    end
    new_booking.save
  
    @user = current_user
     redirect_to(root_path)
  end

  def all
    @bookings = Booking.where({user_id: current_user.id})
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end

end