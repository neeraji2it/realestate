class Contact < ActiveRecord::Base
  attr_accessible :builder_id,:name,:email,:phone,:question,:option,:appointment_time,:property_id
  belongs_to :builder
  belongs_to :property
  
  validates :email, :presence => {:error => "email cannot be blank"} 
end