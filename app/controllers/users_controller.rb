class UsersController < ApplicationController
  def eat
    @user = User.find(params[:id])
    @day = params[:date]
    @id = "#{@user.id}-#{@day}"
    @user.bookings << Booking.new(booked_at: @day)
  end

  def dont
    @user = User.find(params[:id])
    @day = params[:date]
    @id = "#{@user.id}-#{@day}"
    @user.bookings.where(booked_at: @day).first.destroy
  end
end
