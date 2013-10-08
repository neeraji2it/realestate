class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      root_path
    elsif resource_or_scope.is_a?(Builder)
      dashboards_path
    else
      dashboards_path
    end
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
  
  def layout
    (Devise::RegistrationsController and current_admin) ? 'admin' : 'application'
  end


end