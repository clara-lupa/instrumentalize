Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments do
    resources :rentals, only: [:new, :create, :edit, :update, :destroy]
  end

  get "dashboard", to: "pages#dashboard", as: :dashboard
end
