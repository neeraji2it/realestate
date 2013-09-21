class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :provider, :uid, :name
  # attr_accessible :title, :body
  
  #validate :check_exists
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
        :provider=>auth.provider,
        :uid=>auth.uid,
        :email=>auth.info.email,
        :password=>Devise.friendly_token[0,20]
      )
    end
    user
  end
  
  #private
  
  #def check_exists
   # if Builder.exists?(:email => self.email)
    #  errors.add(:email,"User already exists with this email, try another email")
    #end
  #end 
  
end
