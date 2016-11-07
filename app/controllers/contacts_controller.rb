

class ContactsController < ApplicationController
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

  def webcast
    # render "contacts/webcasts"
  end  

end
