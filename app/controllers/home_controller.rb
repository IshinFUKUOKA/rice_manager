class HomeController < ApplicationController
  def index
    @users = User.all
    @lunch_schedule =  {}
    @evening_schedule = {}
    (Date.today..(Date.today + 7.day)).each do |day|
      @lunch_schedule[day] = LunchBooking.with_date(day).pluck(:user_id)
      @evening_schedule[day] = EveningBooking.with_date(day).pluck(:user_id)
    end
  end
end
