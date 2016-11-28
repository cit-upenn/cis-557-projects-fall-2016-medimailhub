class Folder < ApplicationRecord
	belongs_to :user
	acts_as_tree
	has_many :assets, :dependent => :destroy
 
end
