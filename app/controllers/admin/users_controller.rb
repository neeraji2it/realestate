class Admin::UsersController < ApplicationController
  layout :layout
  
  def layout
    'admin'
  end

  def index
    @users=User.all
  end
end
