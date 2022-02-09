Rails.application.routes.draw do
  devise_for :users
  root to: "stamps#index"
  resources :stamps, only: [:new, :create]
end
