Rails.application.routes.draw do


  devise_for :users, :controllers => { registrations: 'registrations' }
  # devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root "statics#home"
  resources :users, only: [:index, :show]
  resources :journeys



end
