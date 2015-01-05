Rails.application.routes.draw do

  root 'static_pages#home'

  post '/sign_in' => 'sessions#create'
  get '/sign_out' => 'sessions#destroy'
  post '/set_location' => 'sessions#set_location'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/match' => 'pets#match'
  get '/users/:id' => 'users#show'
  get '/search' => 'pets#location'
  get '/search/:zipcode' => 'locations#set_location'
	
	resources :users 
  resources :pets

end
