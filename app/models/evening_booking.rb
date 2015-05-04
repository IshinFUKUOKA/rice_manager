class EveningBooking < Booking
  belongs_to :user

  def evening?
    true
  end
end
