ClashOfTheCoders::Application.routes.draw do
  get '/auth/stable/callback', to: 'sessions#create'
  resource :session, only: [:destroy, :new]
  resources :teams, only: [:create, :new]
  resource :unauthenticated, only: :show, controller: 'unauthenticated'

  root 'application#index'
end
