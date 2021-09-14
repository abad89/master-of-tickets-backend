Rails.application.routes.draw do
  resources :events
  resources :users, only: [:index, :show, :create, :destroy] do
    resources :events, only: [:index, :show]
  end

  # post "/login", to: "sessions#create"
  # get "/me", to: "sessions#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
