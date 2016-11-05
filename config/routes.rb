
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
  	
  # Match routes for statuc pages
  get '/launchpad' => 'pages#launchpad'

  # Resourceful routes for the contacts page
  resources :contacts do
    member do
      get :delete
    end  
  end  

end

