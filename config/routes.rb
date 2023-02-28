Rails.application.routes.draw do
  devise_for :users
  resources :preps
  resources :recipes
  resources :saved_recipes
  resources :saved_preps
  get "/discover", to: "recipes#public_index"
  get "/discover_preps", to: "preps#public_index"
  delete "/saved_preps", to: "saved_preps#delete"
  delete "/saved_recipes", to: "saved_recipes#delete"
  root to: "preps#index"
end
