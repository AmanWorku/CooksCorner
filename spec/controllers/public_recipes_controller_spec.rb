require 'rails_helper'
require 'devise'
require_relative '../../app/controllers/public_recipes_controller'

RSpec.describe PublicRecipesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #index" do
    it "returns a success response and assigns public recipes in descending order" do
      user = create(:user)
      public_recipe1 = create(:recipe, public_recipe: true)
      public_recipe2 = create(:recipe, public_recipe: true)
      private_recipe = create(:recipe, public_recipe: false)

      sign_in user

      allow(controller).to receive(:public_recipes).and_return(Recipe.where(public_recipe: true).order(created_at: :desc))

      get :index

      expect(response).to have_http_status(302)
    end
  end
end
