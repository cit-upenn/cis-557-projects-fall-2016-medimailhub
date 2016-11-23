class Appointment < ApplicationRecord
  require 'date'

  belongs_to :initiator, class_name: "User"
	belongs_to :receiver,   class_name: "User"
	validates :initiator_id, presence: true
  validates :receiver_id, presence: true

  has_one :payment

  def create_appointment(parameters, initiator)
  		
    if (parameters[:appointment])
      self.update(:initiator_id => initiator.id, :receiver_id => parameters[:id], :price => parameters[:appointment][:price], :currency => "USD", :datetime => DateTime.parse(parameters[:appointment][:datetime]))
    end	

    return true
  end	

end
