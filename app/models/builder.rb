class Builder < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email,:first_name, :last_name, :company_name, :phone, :country, :address, :city, :logo, :company_url 

  
  has_many :properties, :dependent => :destroy

  # attr_accessible :title, :body
validates :phone, :numericality => { :only_integer => true }, :length => {:minimum => 10, :maximum => 10}

#validates_format_of :first_name, :with => /\A[[:graph:]]\Z/i
has_attached_file :logo

validates_format_of :first_name,:last_name,:company_name ,:address, :city,:with => /\A[^\d]+\Z/, :message => "field should only have letters"

 validates_format_of :company_url, :with => URI::regexp(%w(http https)), :message=>"is like this http://www.companyname.com"

 validate :email_exists
  
  def email_exists
    if User.exists?(:email => self.email)
      errors.add(:email,"User already exists with this email, try another email")
    end
  end 
end