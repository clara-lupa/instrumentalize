Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments do
    resources :rentals, only: [:new, :create, :edit, :update, :destroy] do
    end
  end
  get 'my_instruments', to: 'instruments#my_instruments'
end
