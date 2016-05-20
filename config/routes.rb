Rails.application.routes.draw do

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resource :users

  root 'pets#index'

end
