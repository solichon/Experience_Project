Rails.application.routes.draw do
  devise_for :users
  root to: 'timeslots#index'

  get "home", to: "pages#home"
  get "about", to: "pages#about"
  resources :timeslots, only: [ :index, :show ]
  resources :activities, only: [ :new, :create, :show ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
