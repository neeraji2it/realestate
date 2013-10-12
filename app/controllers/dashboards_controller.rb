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
    @properties.each do|property|
    property.update_attributes(:search_view => property.search_view + 1)
    end
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

  
  #    query=[]
#    query << "#{params[:property_listing]}" if(params[:property_listing]).present?
#    query << "#{params[:property_type]}" if(params[:property_type]).present?
#    query << "#{params[:city]}" if(params[:city]).present?
#    query << "#{params[:sale_price]}" if(params[:sale_price]).present?
   # @properties = Property.search("*#{query}*", :page=>params[:page], :per_page=>5)   


