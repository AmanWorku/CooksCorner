require 'rails_helper'
require_relative '../../app/controllers/recipe_foods_controller'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:food) { create(:food, user:) }
  let(:recipe) { create(:recipe, user:) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { recipe_id: recipe.id }
      expect(response).to be_successful
    end

    it 'assigns the necessary variables' do
      get :new, params: { recipe_id: recipe.id }
      expect(assigns(:recipe_food)).to be_a_new(RecipeFood)
      expect(assigns(:foods)).to eq(Food.where(user:))
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe 'POST #create' do
    let(:recipe_food_params) { { recipe_id: recipe.id, recipe_food: { id: food.id, quantity: 1 } } }

    it 'creates a new recipe food' do
      expect do
        post :create, params: recipe_food_params
      end.to change(RecipeFood, :count).by(1)
    end

    it 'redirects to the recipe show page' do
      post :create, params: recipe_food_params
      expect(response).to redirect_to(recipe_path(recipe.id))
    end
  end
end
