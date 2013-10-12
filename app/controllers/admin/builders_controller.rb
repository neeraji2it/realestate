class Admin::BuildersController < ApplicationController
  layout :layout
  
  def layout
    'admin'
  end
  
  def index
    @builders=Builder.all
  end
   
  def block_builders
    @builders=Builder.find(params[:id])
    if params[:status] == 'tru'
      @builders.update_attribute(:approved,true)
    else
      @builders.update_attribute(:approved,false)
    end
    redirect_to '/admin/builders/'
  end
    
  def manage_properties
    @builder = Builder.find_by_id(params[:id])
    @properties = @builder.properties
  end
    
end
