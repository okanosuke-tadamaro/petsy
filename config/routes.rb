Rails.application.routes.draw do

  root 'pets#index'

  post '/set_location' => 'sessions#set_location'

  resources :pets

end
