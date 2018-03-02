Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "home", to: "pages#home"
  get "about", to: "pages#about"
  resources :timeslots, only: [ :index, :show, :new, :create ]
  resources :activities, only: [ :index, :show, :new, :create ]
  resources :bookings, only: [ :new, :create ]
end
