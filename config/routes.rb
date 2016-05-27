Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root "statics#home"

  resources :journeys  do
    resources :comments
  end
  get "/inbox", to: "comments#inbox"
  get "/outbox", to: "comments#outbox"

  resources :comments, only: [] do 
    member do
      get "accept"
      get "reject"
      get "cancel"
    end
  end

  resources :users, only: [:index, :show]
end
