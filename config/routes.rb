Rails.application.routes.draw do
  devise_for :users
  
  resources :foods
  resources :recipes do
    get :shopping_list, on: :collection
  end

  get 'public_recipes', to: 'recipes#public_recipes'

  root to: 'recipes#index'
end