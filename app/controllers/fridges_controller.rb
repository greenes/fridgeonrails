class FridgesController < ApplicationController

  before_action :authenticate_user!

  def index
    @fridges = current_user.fridges
  end

  def show
    @fridge = Fridge.find(params[:id])
  end

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = current_user.fridges.new(fridge_params)
      if @fridge.save
        redirect_to @fridge
      else
       render :new
     end
  end

  def edit
    @fridge = Fridge.find(params[:id])
  end


  def update
      @fridge = Fridge.find( params[:id] )
    if @fridge.update( fridge_params )
      redirect_to @fridge
    else
      render :edit
    end
  end

  def destroy
    @fridge = Fridge.find(params[:id])
    @fridge.destroy
    redirect_to fridges_path
  end

private
  def fridge_params
    params.require(:fridge).permit(:location, :brand, :size)
  end


end
