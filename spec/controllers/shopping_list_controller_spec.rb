require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "returns a success response and assigns the shopping list and total price" do
      shopping_list = [double("RecipeFood", price: 10), double("RecipeFood", price: 15), double("RecipeFood", price: 20)]

      allow(RecipeFood).to receive(:shopping_list).with(user).and_return(shopping_list)

      get :index

      expect(response).to be_successful
      expect(assigns(:shop_list)).to eq(shopping_list)
      expect(assigns(:total_price)).to eq(45)
    end
  end
end
