

class ContactsController < ApplicationController
  require "opentok"

  def index
  	@contacts = User.find(current_user.id).contacts
  	
  	me = Array.new
  	me << current_user
  	# Remove current user and pass the remaining users
  	@all_users = User.all - me 
  end

  def show
	redirect_to(:action => "index")
  end

  def delete
   	# Delete and Destroy a contact
  	@contact = Contact.find(params[:id])
  	@contact.destroy 
  	redirect_to(:action => "index")	
  end

  def destroy
  	redirect_to(:action => "index")
  end	

  # Being reused for add - to be changed later
  def edit
 	  user = User.find(params[:id])
 	  contact = Contact.new(:contact_person => user.id , :contact_name => "#{user.first_name} #{user.last_name}")
 	  current_user.contacts << contact

 	  contact_pat = Contact.new(:contact_person => current_user.id , :contact_name => "#{current_user.first_name} #{current_user.last_name}")
 	  user.contacts << contact_pat
 	
 	  redirect_to(:action => "index")
  end	

  def create_session
    # Create a new session if dialed via the contact page
    opentok = OpenTok::OpenTok.new(API_OPENTOK[:key], API_OPENTOK[:secret])
    # Create a session id
    session_id = opentok.create_session.session_id
    # Update session id to the current user database
    current_user.session_id = session_id
    current_user.save
    contact = User.find(Contact.find(params[:id]).contact_person)
    # Update session id to the contacts database
    contact.session_id = session_id
    contact.save
    redirect_to(:action => "webcast")
  end  

  def webcast
    
    opentok = OpenTok::OpenTok.new(API_OPENTOK[:key], API_OPENTOK[:secret])
    @session_id = current_user.session_id
    if (@session_id.empty?)
      redirect_to(:action => "index")   
    else
      @token = opentok.generate_token(@session_id)
    end  
    
  end  

end
