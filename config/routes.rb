
Rails.application.routes.draw do

  # Define root URI
  root 'pages#launchpad'
  	
  # Define routes for pages
  get '/launchpad' => 'pages#launchpad'
  get '/contacts'	=> 'pages#contacts'

end

