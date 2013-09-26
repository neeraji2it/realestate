class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
  
  def after_sign_up_path_for(resource_or_scope)
    root_path
  end
  
  def is_login?
    unless current_user or current_builder
      flash[:alert] = "Please login"
      redirect_to dashboards_path
    end
  end
  
  
end