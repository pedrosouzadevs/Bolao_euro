Rails.application.routes.draw do
  root "matches#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :matches do
    resources :bets
  end
  resources :bet_champions, only: [:new, :create]
  get "my_bets" => "matches#my_bets"
  get "champions" => "bet_champions#index"
  get "ranking" => "users#ranking"
  get "allbets" => "users#all_bets"

  # Defines the root path route ("/")
end
