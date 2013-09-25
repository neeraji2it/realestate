class PropertiesController < ApplicationController
  before_filter :is_builder?, :only => ["new", "edit", "create", "update", "destroy"]
  
  def index
    @properties = Property.all
  end
  
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    1.times {@property.images.build}
    @json = Property.all.to_gmaps4rails
  end
  
  def create
    @property = Property.new(params[:property].merge(:builder_id => current_builder.id ))
    if @property.images.blank?
      1.times {@property.images.build}
    end
    
    if params[:property][:property_type]=='Apartment'
      @property.no_of_houses=""
      @property.no_of_plots=""
    elsif params[:property][:property_type]=='Villa'
      @property.no_of_flats=""
      @property.no_of_plots=""
    elsif params[:property][:property_type]=='Row House'
      @property.no_of_flats=""
      @property.no_of_plots=""
    elsif params[:property][:property_type]=='Layout'
      @property.no_of_houses=""
      @property.no_of_flats=""
      @property.no_of_floors=""
    else
      flash[:notice] = "Please select property type"
    end
    
    if params[:property][:property_status]=='Ready To Move'
      @property.start_date=""
      @property.upcoming_date=""
    elsif params[:property][:property_status]=='Ongoing'
      @property.upcoming_date="" 
    elsif params[:property][:property_status]=='Upcoming'
      @property.start_date=""
      @property.end_date=""
    else
      flash[:notice] = "Please select property status"
    end
    
    if @property.save
      flash[:notice]="property created successfully"
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property = Property.find(params[:id])
    @property.update_attributes(params[:property])
    redirect_to properties_path(@property)
  end
  
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end
end