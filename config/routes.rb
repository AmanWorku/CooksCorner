Rails.application.routes.draw do
  devise_for :users
  
  resources :foods
  resources :recipes do
    get :shopping_list, on: :collection
  end

  root to: 'recipes#index'
end