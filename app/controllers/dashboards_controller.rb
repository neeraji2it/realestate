class DashboardsController < ApplicationController
 
 
  def index
    if current_builder
      @builder = current_builder 
    elsif current_admin
      render :layout => 'admin'
    end
  end
  
  def search

    @properties = Property.property_listing(params[:property_listing]).property_type(params[:property_type]).sale_price(params[:sale_price]).city(params[:city]).paginate(:page => params[:page], :per_page => 5)
    
    @json = @properties.to_gmaps4rails
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @property = Property.find(params[:id])
    @json = @property.to_gmaps4rails
  end
 
 end
