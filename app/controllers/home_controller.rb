class HomeController < ApplicationController
  def index
    @users = User.all
    @schedule = {}
    (Date.today..(Date.today + 7.day)).each do |day|
      @schedule[day] = Booking.with_date(day).pluck(:user_id)
    end
  end
end
