class BookingsController < ApplicationController

  load_and_authorize_resource

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
    @ticket_range = (@event.tickets_left? > 6) ? 6 : @event.tickets_left?
  end

  def create
    ticket_quantity = params[:ticket_quantity][0].to_i
    ticket_quantity.times do
      new_booking = Booking.new(booking_params)
      if new_booking.event.sold_out?
        redirect_to root_path, alert: "Event Sold Out"
      end
      new_booking.save
    end
  
    @user = current_user
     redirect_to(root_path)
  end

  def shopping_cart
    @unpaid_bookings = current_user.bookings.unpaid
  end

  def all
    @bookings = Booking.where({user_id: current_user.id})
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end

end