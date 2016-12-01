# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  phone_one              :string
#  phone_two              :string
#  d_o_b                  :datetime
#  gender                 :string           default("male")
#  role                   :string           default("patient")
#

class User < ApplicationRecord
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, :presence => true
  #validates :phone_one, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  #devise validates presence of password and email
  acts_as_messageable

  def mailboxer_name
    self.first_name+" "+self.last_name
  end

  def mailboxer_email(object)
    self.email
  end

  has_many :active_contacts, class_name:  "ContactRelationship", foreign_key: "contacter_id", dependent: :destroy
  has_many :passive_contacts, class_name:  "ContactRelationship",  foreign_key: "contact_id",  dependent: :destroy

  has_many :contacts, through: :active_contacts,  source: :contact
  has_many :contacters, through: :passive_contacts, source: :contacter

  has_many :assets
  has_many :folders
  
  has_many :initiated_appts, class_name:  "Appointment", foreign_key: "initiator_id", dependent: :destroy
  has_many :received_appts, class_name:  "Appointment",  foreign_key: "receiver_id",  dependent: :destroy

  # has_many :initiated_appts, through: :active_appointments,  source: :receiver
  # has_many :received_appts, through: :passive_appointments, source: :initiator

  def add_contact(other_user)
    active_contacts.create(contact_id: other_user.id)
  end

  def remove_contact(other_user)
    active_contacts.find_by(contact_id: other_user.id).destroy
  end

end

