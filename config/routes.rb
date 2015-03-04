Rails.application.routes.draw do
  get '/auth/stable/callback', to: 'sessions#create'
  resource :scoreboard, only: [:show]
  resource :scorecard, only: [:create, :destroy, :new, :show]
  resource :session, only: [:destroy, :new]
  resources :teams, only: [:create, :edit, :index, :new, :show, :update]
  resource :unauthenticated, only: :show, controller: 'unauthenticated'

  namespace :admin do
    resource :votes, only: :show
  end

  root 'application#index'
end
