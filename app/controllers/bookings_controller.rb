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
    @bookings = current_user.bookings.unpaid_grouped_events

    @amounts = @bookings.map do |booking|
      (booking.event.event_price * @bookings.count[booking.event.id])

    end
    sum = @amounts.inject(:+)
    @amount = sum.to_i
    @stripe_amount = (sum*100).to_i
  end

  def stripe_checkout
    bookings = current_user.bookings.unpaid_grouped_events

    amounts = bookings.map do |booking|
      (booking.event.event_price * bookings.count[booking.event.id])
    end
    sum = amounts.inject(:+)
    @stripe_amount = (sum*100).to_i

        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @stripe_amount,
          :description => 'Rails Stripe customer',
          :currency    => 'gbp'
        )

    bookings.each do |paid_booking|
      paid_booking.update({paid: true})
    end

    redirect_to bookings_all_path
  end

  def all
    @bookings = Booking.where({user_id: current_user.id}).paid
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end

end