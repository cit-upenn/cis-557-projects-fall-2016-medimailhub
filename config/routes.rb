
Rails.application.routes.draw do



  get 'appointments/index'

  devise_for :users
  # Define root URI
  devise_scope :user do
  	authenticated :user do
      #Naming the root routes causes mailboxer to crash when email is sent. Do not uncomment till fixed
    	root :to => 'pages#launchpad'#, as: :authenticated_root
  	end
  	unauthenticated :user do

    	root :to => 'devise/registrations#new'#, as: :unauthenticated_root
  	end
  end
  	
  # Match routes for static pages
  get '/launchpad' => 'pages#launchpad'
  get "/contacts/create_session/:id" => "contacts#create_session", as: :create_session
  post "/contacts/create_appointment/:id" => "contacts#create_appointment", as: :create_appointment
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  #Route for webcast
  get '/webcast' => 'contacts#webcast'

  resources :appointments
  post '/appointments/make_payment/:id' => "appointments#make_payment", as: :make_payment

 # Resourceful routes for the contacts page
  resources :contacts do
    member do
      get :delete
    end  
  end  

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end

