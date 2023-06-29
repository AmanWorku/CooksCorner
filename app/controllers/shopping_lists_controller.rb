class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe_foods = current_user.recipe_foods.includes(:food)
  end
end