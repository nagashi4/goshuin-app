Rails.application.routes.draw do
  devise_for :users
  root to: "stamps#index"
  resources :stamps do
  resources :comments, only: :create
  end
end
