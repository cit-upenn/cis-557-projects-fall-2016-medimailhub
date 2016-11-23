class AppointmentsController < ApplicationController
  
  def index
  	@received_appointments = current_user.received_appts
  	tmp_appointments = []
  	@received_appointments.each do |appointment|
  		tmp = Hash.new
  		user = User.find(appointment.initiator_id)
      tmp[:id] = appointment.id
      tmp[:appointment_id] = appointment.id
      tmp[:ip_address] = request.remote_ip
  		tmp[:first_name] = user.first_name
  		tmp[:last_name] = user.last_name
  		tmp[:datetime] = appointment.datetime
  		tmp[:price] = appointment.price
  		tmp[:currency] = appointment.currency
  		tmp[:paid] = appointment.paid
  		tmp_appointments << tmp
  	end	

  	@appointments = tmp_appointments
  	puts tmp_appointments
  		
  end

  def make_payment
  	@payment = Payment.new
  	respond_to do |format|
      apt = Appointment.find(params[:id])
      paid = apt.validate_and_pay(params, @payment, request.remote_ip )
        		
      if (paid.include? "Error")
        flash[:error] = paid
        redirect_to(:action => "index")
      else
        apt = Appointment.find(params[:id])
        if apt.payment
          apt.paid = true
          apt.save 
          flash[:success] = "Payment sucessfully made"
          redirect_to(:action => "index")
        end
      end  
      format.json { head :no_content }
      format.js 

    end   
  end	
end
