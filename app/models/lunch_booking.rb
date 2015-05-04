class LunchBooking < Booking
  belongs_to :user

  def lunch?
    true
  end
end
