Rails.application.routes.draw do
  root "sessions#new"
  resources :sessions, only: :new
  get :home, to: "homes#show"
end
