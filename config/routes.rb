Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :shops, only: [:index, :show]
  resources :bookings, only: [:create]
  namespace :owner do
    resource :dashboards, only: [:show]
    resources :shops, only: [:new, :create]
    resources :bookings, only: [] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
end
