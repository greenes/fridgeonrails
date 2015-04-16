class FoodsController < ApplicationController


  def new
    @fridge = Fridge.find(params[:fridge_id])
    @food = @fridge.foods.new
  end

  def create
    @fridge = Fridge.find(params[:fridge_id])
    @food = @fridge.foods.new(food_params)
      if @fridge.save
        redirect_to @fridge
      else
       render :new
     end
  end

  def destroy
    @fridge = Fridge.find(params[:fridge_id])
    @food = @fridge.foods.find(params[:id])
    @food.destroy
    redirect_to fridge_path(@fridge.id)
  end

private
  def food_params
    params.require(:food).permit(:name, :weight)
  end
end
