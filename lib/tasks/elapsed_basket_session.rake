namespace :elapsed_basket_session do

  desc "remove unpaid bookings from basket"
  task basket_session: :environment do
    puts "checking baskets for elapsed bookings"
    destroyed = Booking.two_hour_bookings
    puts "#{destroyed} bookings were deleted."
  end

end