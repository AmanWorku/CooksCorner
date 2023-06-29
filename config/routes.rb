Rails.application.routes.draw do
  devise_for :users
  
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes do
    get :shopping_list, on: :collection
  end

  resources :public_recipes, only: [:index]
  get '/shopping_list', to: 'shopping_lists#index', as: 'shopping_list'
  root to: 'recipes#index'
end