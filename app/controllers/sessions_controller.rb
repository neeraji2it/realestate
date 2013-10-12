class SessionsController < Devise::SessionsController
 def destroy
    if current_user.oauth_token
      redirect_to "https://www.facebook.com/logout.php?next=#{root_url}&access_token=#{current_user.oauth_token}"
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    else
      super
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    end
    #super
  end
end