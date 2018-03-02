Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "home", to: "pages#home"
  get "about", to: "pages#about"
  resources :timeslots, only: [ :index, :show ]
  resources :activities, only: [ :new, :create, :show, :index ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
