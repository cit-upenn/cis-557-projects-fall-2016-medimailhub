class UserMailer < ApplicationMailer
	include Rails.application.routes.url_helpers
    include ActionView::Helpers::UrlHelper

    default from: 'no-reply@mailboxer.com'
	def email(current_user, invitee, email)
		@user = current_user
    	@url  = 'http://www.medimailhub.us'
    	@invitee=invitee
    	mail(to: email, subject: 'Join Medimail!')
  	end
end
