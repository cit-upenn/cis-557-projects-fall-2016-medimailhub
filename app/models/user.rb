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
  
  has_many :contacts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, :presence => true

  acts_as_messageable

  def mailboxer_name
    self.first_name+" "+self.last_name
  end

  def mailboxer_email(object)
    self.email
  end
end

