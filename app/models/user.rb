class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :provider, :uid, :name, :oauth_token, :oauth_expires_at
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  validate :check_email_exists
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
        :provider=>auth.provider,
        :uid=>auth.uid,
        :email=>auth.info.email,
        :oauth_token=>auth.credentials.token,
        :oauth_expires_at=>Time.at(auth.credentials.expires_at),
        :password=>Devise.friendly_token[0,20]
      )
    end
    user
  end
  
  def check_email_exists
    if ::Builder.exists?(:email => self.email)
      errors.add(:email,"Builder already exists with this email, try another email")
    end
  end 
end