Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"

  devise_scope :user do
    get '/my_bookings', to: 'bookings#my_bookings', as: :my_bookings
  end

  resources :flats do
    resources :reviews, only: %i[show create destroy]
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[update destroy]
end
