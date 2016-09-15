Rails.application.routes.draw do
  resources :food_suburbs
  resources :foods
  resources :food_tags
  resources :tags
  resources :suburbs

  namespace :api do
    resources :foods
  end

  get '/', to: 'application#index'

  post '/api/results', to: 'api/foods#present'


end
