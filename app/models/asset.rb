class Asset < ApplicationRecord
	belongs_to :user

#set up "uploaded_file" field as attached_file (using Paperclip) 
  
  has_attached_file :uploaded_file, styles: { medium: "300x300>", thumb: "100x100#" },

                    :url => "/assets/get/:id", 
                    :path => ":Rails_root/assets/:id/:basename.:extension"

  #validates_attachment_presence :uploaded_file
  #validates :uploaded_file, attachment_presence: true

  #Only presence validation not working, have to give a file type, why?

  validates_attachment_content_type :uploaded_file, content_type: /\Aimage\/.*\z/
  

  def file_name 
    uploaded_file_file_name 
  end

end

