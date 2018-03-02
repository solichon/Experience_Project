Rails.application.routes.draw do
  devise_for :users
  root to: 'timeslots#index'

  resources :timeslots, only: [ :index, :show, :create, :new]
  resources :activities, only: [ :new, :create, :show ]

end
