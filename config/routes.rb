
Rails.application.routes.draw do

  devise_for :users
  # Define root URI
  devise_scope :user do
  	authenticated :user do
    	root :to => 'pages#launchpad', as: :authenticated_root
  	end
  	unauthenticated :user do
    	root :to => 'devise/registrations#new', as: :unauthenticated_root
  	end
  end
  	
  # Define routes for pages
  get '/launchpad' => 'pages#launchpad'
  get '/contacts'	=> 'pages#contacts'

end

