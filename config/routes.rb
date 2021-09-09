Rails.application.routes.draw do
  resources :events
  resources :users, only: [:index, :show, :create]

  post "/login", to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
