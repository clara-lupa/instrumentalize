Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments do
    resources :rentals, only: [:new, :create, :edit, :update, :destroy]
  end
  get "/my_rentals", to: "rentals#my_rentals", as: :my_rentals
  get "dashboard", to: "pages#dashboard", as: :dashboard
end
