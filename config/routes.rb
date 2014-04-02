ClashOfTheCoders::Application.routes.draw do
  get '/auth/stable/callback', to: 'sessions#create'
  resource :session, only: [:new, :destroy]

  resource :unauthenticated, only: :show, controller: 'unauthenticated'

  root 'application#index'
end
