Rails.application.routes.draw do
  resources :timeslots, only: [ :index ]

  devise_for :users

  root to: 'timeslots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
