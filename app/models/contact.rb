class Contact < ApplicationRecord

	belongs_to :user
	validates_uniqueness_of :user_id, :scope => :contact_person
end
