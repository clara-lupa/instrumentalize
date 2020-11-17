Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments, only: :index do
    resources :rentals, only: [:new, :create]
  end
end
