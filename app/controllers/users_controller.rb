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

  def comment
    @user = User.find(params[:id])
    @user.update(comment: params[:user][:comment])
    render nothing: true
  end

  private
  def retrieve_params
    @user = User.find(params[:id])
    @day = params[:date]
    @time = params[:time]
    @id = "#{@user.id}-#{@day}-#{@time}"
  end

  def user_params
    params.require(:users).permit(:name, :comment)
  end
end
