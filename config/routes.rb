Rails.application.routes.draw do
  devise_for :users
  
  resources :foods
  resources :recipes do
    get :shopping_list, on: :collection
  end

  get 'public_recipes', to: 'recipes#public_recipes'
  get 'shopping_list', to: 'shopping_list#index'
  root to: 'recipes#index'
end