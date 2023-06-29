Rails.application.routes.draw do
  devise_for :users
  
  resources :foods
  resources :recipes do
    get :shopping_list, on: :collection
  end

  # get 'public_recipes', to: 'recipes#public_recipes'
  resources :public_recipes, only: [:index]
  # get 'general_shopping_list', to: 'general_shopping_list#index'
  get '/shopping_list', to: 'shopping_lists#index', as: 'shopping_list'
  root to: 'recipes#index'
end