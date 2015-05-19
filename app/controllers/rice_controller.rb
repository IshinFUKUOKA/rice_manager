class RiceController < ApplicationController
  def index
    @rice_history = Rice.all
    @rice = Rice.new
    @users = User.all
  end

  def create

    redirect_to rice_index_path
  end
end
