class Booking < ActiveRecord::Base
  belongs_to :user
  scope :with_date, ->(date) { where(booked_at: date) }
  scope :lunch, -> { where(type: 'LunchBooking') }
  scope :evening, -> { where(type: 'eveningBooking') }

  def lunch?
    false
  end

  def evening?
    false
  end
end
