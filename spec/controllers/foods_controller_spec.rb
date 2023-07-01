require 'rails_helper'
require_relative '../../app/controllers/foods_controller'

RSpec.describe FoodsController, type: :controller do
    describe "GET #index" do
      it "returns a success response" do
        user = create(:user)
        food = create(:food, user: user)
        
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)
        
        get :index
        
        expect(response).to be_successful
        expect(assigns(:foods)).to eq([food])
      end
    end
    
    describe "POST #create" do
      context "with valid parameters" do
        it "creates a new food" do
          user = create(:user)
          food_attributes = attributes_for(:food)
          
          allow(controller).to receive(:authenticate_user!).and_return(true)
          allow(controller).to receive(:current_user).and_return(user)
          
          expect {
            post :create, params: { food: food_attributes }
          }.to change(Food, :count).by(1)
          
          expect(response).to redirect_to(foods_url)
          expect(flash[:notice]).to eq('Food was successfully created.')
        end
      end
      
      context "with invalid parameters" do
        it "does not create a new food" do
          user = create(:user)
          invalid_food_attributes = attributes_for(:food, name: nil)
          
          allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)
          
          expect {
            post :create, params: { food: invalid_food_attributes }
          }.not_to change(Food, :count)
          
          expect(response).to render_template(:new)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
    
    describe "DELETE #destroy" do
      it "destroys the requested food" do
        user = create(:user)
        food = create(:food, user: user)
        
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)
        
        expect {
          delete :destroy, params: { id: food.to_param }
        }.to change(Food, :count).by(-1)
        
        expect(response).to redirect_to(foods_url)
        expect(flash[:notice]).to eq('Food was successfully destroyed.')
      end
    end
  end
  