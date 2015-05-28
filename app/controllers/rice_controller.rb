class RiceController < ApplicationController
  def index
    @rice_history = Rice.all
    @rice = Rice.new
    @users = User.all
  end

  def edit
    @rice = Rice.find(params[:id])
    @users = User.all
  end

  def create
    @rice = Rice.new(rice_params)

    @rice.save

    redirect_to rice_index_path
  end

  def update
    @rice = Rice.find(params[:id])
    @rice.update(rice_params)
    redirect_to rice_index_path
  end
  def rice_params
    params.require(:rice).permit(:name, :price, :buyer_id, :purchased_at)
  end
end
