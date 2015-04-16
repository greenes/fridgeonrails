class DrinksController < ApplicationController

  def new
    @fridge = Fridge.find(params[:fridge_id])
    @drink = @fridge.drinks.new
  end

  def create
    @fridge = Fridge.find(params[:fridge_id])
    @drink = @fridge.drinks.new(drink_params)
      if @drink.save
        redirect_to @fridge
      else
       render :new
     end
  end


  def destroy
    @fridge = Fridge.find(params[:fridge_id])
    @drink = @fridge.drinks.find(params[:id])
    @drink.destroy
    redirect_to fridge_path(@fridge.id)
  end


private
  def drink_params
    params.require(:drink).permit(:name, :totaloz)
  end


end
