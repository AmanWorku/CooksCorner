# app/controllers/foods_controller.rb
class FoodsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @foods = current_user.foods.all
    end
  
    def new
      @food = current_user.foods.build
    end
  
    def create
      @food = current_user.foods.build(food_params)
  
      if @food.save
        redirect_to foods_path
      else
        render :new
      end
    end
  
    def show
      @food = current_user.foods.find(params[:id])
    end
  
    def edit
      @food = current_user.foods.find(params[:id])
    end
  
    def destroy
      @food = current_user.foods.find(params[:id])
      @food.destroy
      redirect_to foods_path
    end
  
    def my_foods
      @foods = current_user.foods.all
    end
  
    private
  
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
  end