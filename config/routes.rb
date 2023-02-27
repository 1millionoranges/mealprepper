Rails.application.routes.draw do
  devise_for :users
  resources :preps
  resources :recipes
end
