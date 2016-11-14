

class ContactsController < ApplicationController
  require "opentok"

  def index
  	@contacts = current_user.contacts
  	@contacts_physicians = current_user.contacts.where(role: 'doctor')
    @contacts_patients = current_user.contacts.where(role: 'patient')
  	me = Array.new
  	me << current_user
  	# Remove current user and pass the remaining users
  	
    @users_physicians = User.where(role: 'doctor') - me - @contacts
    @users_patients = User.where(role: 'patient') - me - @contacts

    @all_users = []

  end

  def show
	redirect_to(:action => "index")
  end

  def delete
   	# Delete and Destroy a contact
    user = User.find(params[:id])
    current_user.remove_contact(user)
    user.remove_contact(current_user)
    flash[:alert] = "#{user.first_name} #{user.last_name} has been removed from your contacts" 
  	redirect_to(:action => "index")	
  end

  def destroy
  	redirect_to(:action => "index")
  end	

  # Being reused for add - to be changed later
  def edit
 	  user = User.find(params[:id])
 	  current_user.add_contact(user)
    user.add_contact(current_user)
    flash[:notice] = "Your contacts have been updated" 	
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
    contact = User.find(params[:id])
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
