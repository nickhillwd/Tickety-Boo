class BookingsController < ApplicationController

  load_and_authorize_resource

  def new

    @event = Event.find_by(params[:id])
    @booking = Booking.new
  end

  def create
    new_booking = Booking.new(booking_params)
    new_booking.save
    @amount = ((new_booking.event.event_price)*100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )
    @user = current_user
     redirect_to(root_path)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end

end