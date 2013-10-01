class Contact < ActiveRecord::Base
  attr_accessible :builder_id,:name,:email,:phone,:question,:option,:appointment_time
  belongs_to :builder
  
  validates :email, :presence => {:error => "email cannot be blank"} 
end