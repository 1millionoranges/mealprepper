Rails.application.routes.draw do
  devise_for :users
  resources :preps
  resources :recipes
  resources :saved_recipes
  get "/discover", to: "recipes#public_index"
  root to: "preps#index"
end
