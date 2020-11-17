Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :rentals, only: [:new, :create]
  end
end
