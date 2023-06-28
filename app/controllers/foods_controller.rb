class FoodsController < ApplicationController 
    before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = current_user.foods
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end
  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_path(@food, current_user), notice: 'Food successfully added!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :unit_price, :quantity, :user_id)
  end
end
