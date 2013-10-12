class BuilderregistrationsController < ApplicationController
  def new
    @builder=Builder.new
  end

  def create
    @builder = Builder.new(params[:project])
    @builder.save
    redirect_to 'admins'
  end

end