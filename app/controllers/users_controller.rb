class UsersController < ApplicationController
  before_filter :retrieve_params, only: [:eat, :dont]
  def eat
    if params[:time] == 'lunch'
      @user.bookings << LunchBooking.new(booked_at: @day)
    elsif params[:time] == 'evening'
      @user.bookings << EveningBooking.new(booked_at: @day)
    end
  end

  def dont
    if params[:time] == 'lunch'
      @user.bookings.lunch.where(booked_at: @day).first.destroy
    elsif params[:time] == 'evening'
      @user.bookings.evening.where(booked_at: @day).first.destroy
    end
  end

  private
  def retrieve_params
    @user = User.find(params[:id])
    @day = params[:date]
    @time = params[:time]
    @id = "#{@user.id}-#{@day}-#{@time}"
  end
end
