ClashOfTheCoders::Application.routes.draw do
  get '/auth/stable/callback', to: 'sessions#create'
  resource :scoreboard, only: [:show]
  resource :scorecard, only: [:create, :new]
  resource :session, only: [:destroy, :new]
  resources :teams, only: [:create, :edit, :index, :new, :show, :update]
  resource :unauthenticated, only: :show, controller: 'unauthenticated'

  root 'application#index'
end
