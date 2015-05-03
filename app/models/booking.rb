class Booking < ActiveRecord::Base
  belongs_to :user
  scope :with_date, ->(date) { where(booked_at: date) }
end
