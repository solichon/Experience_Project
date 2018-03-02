Rails.application.routes.draw do
  devise_for :users
  root to: 'timeslots#index'

  resources :timeslots, only: [ :index, :show, :new, :create ]
  resources :activities, only: [ :index, :show, :new, :create ]
end
