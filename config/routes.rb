Rails.application.routes.draw do

  root 'pets#index'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resource :users

end
