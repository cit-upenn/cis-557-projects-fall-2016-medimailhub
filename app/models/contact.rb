# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  contact_person :integer
#  contact_name   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Contact < ApplicationRecord

	belongs_to :user
	validates_uniqueness_of :user_id, :scope => :contact_person
end
