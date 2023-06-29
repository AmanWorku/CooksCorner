Rails.application.routes.draw do
  devise_for :users
  
  
  resources :recipes do
    resources :recipe_foods. only: [:new, :create, :destroy, :show, :edit, :update] 
  end

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  get '/shopping_list', to: 'shopping_lists#index', as: 'shopping_list'
  root to: 'recipes#index'
end