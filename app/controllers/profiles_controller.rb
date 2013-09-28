class ProfilesController < ApplicationController
  def show
    @builder = current_builder
    @user = current_user
  end
end