Rails.application.routes.draw do
  resources :food_suburbs
  resources :foods
  resources :food_tags
  resources :tags
  resources :suburbs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
