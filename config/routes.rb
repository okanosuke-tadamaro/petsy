Rails.application.routes.draw do

  root 'pets#index'

  post '/set_location' => 'sessions#set_location'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/match' => 'pets#match'
  get '/search' => 'pets#location'
  get '/search/:zipcode' => 'locations#set_location'
 
  resources :pets

end
