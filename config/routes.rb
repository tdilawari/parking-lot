Rails.application.routes.draw do
  get 'home/index'
  resources :vehicles
  resources :two_wheelers, controller: 'vehicles', type: 'TwoWheeler'
  resources :four_wheelers, controller: 'vehicles', type: 'FourWheeler'
  resources "parking_slots"
  root to: "homes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
