ClashOfTheCoders::Application.routes.draw do
  get '/auth/stable/callback', to: 'sessions#create'
  resource :session, only: [:new]

  root 'application#index'
end
