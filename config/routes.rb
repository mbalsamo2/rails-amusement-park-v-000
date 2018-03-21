Rails.application.routes.draw do

  resources :users
  resources :attractions
  root 'users#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/attractions/:id/ride' => 'attractions#ride', as: :ride
end
