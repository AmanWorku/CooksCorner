# spec/controllers/foods_controller_spec.rb
require 'rails_helper'


RSpec.describe FoodsController, type: :controller do
    include Devise::Test::ControllerHelpers

    let(:user) { create(:user) }
    let(:food) { create(:food, user: user) }
  
    before { sign_in user }
  
    describe "GET #index" do
      it "assigns user's foods to @foods" do
        get :index
        expect(assigns(:foods)).to eq(user.foods.all)
      end
  
      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end

  describe "GET #new" do
    it "assigns a new food as @food" do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) { { food: attributes_for(:food) } }

      it "creates a new food" do
        expect {
          post :create, params: valid_params
        }.to change(Food, :count).by(1)
      end

      it "redirects to the foods path" do
        post :create, params: valid_params
        expect(response).to redirect_to(foods_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { food: attributes_for(:food, name: nil) } }

      it "does not create a new food" do
        expect {
          post :create, params: invalid_params
        }.not_to change(Food, :count)
      end

      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested food as @food" do
      get :show, params: { id: food.id }
      expect(assigns(:food)).to eq(food)
    end

    it "renders the show template" do
      get :show, params: { id: food.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "assigns the requested food as @food" do
      get :edit, params: { id: food.id }
      expect(assigns(:food)).to eq(food)
    end

    it "renders the edit template" do
      get :edit, params: { id: food.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested food" do
      food_to_destroy = create(:food, user: user)
      expect {
        delete :destroy, params: { id: food_to_destroy.id }
      }.to change(Food, :count).by(-1)
    end

    it "redirects to the foods path" do
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
    end
  end

  describe "GET #index" do
  it "assigns user's foods to @foods" do
    sign_in user
    get :index
    expect(assigns(:foods)).to eq(user.foods.all)
  end

  it "renders the index template" do
    sign_in user
    get :index
    expect(response).to render_template(:index)
  end
end
end
