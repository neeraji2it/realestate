class PropertiesController < ApplicationController

  before_filter :allow_builder, :only => [ "edit",  "destroy"]
  
  def allow_builder
    @property = Property.find(params[:id])
    unless @property.builder_id==current_builder.id
      flash[:notice]="Access Denied"
      redirect_to properties_path
    end
  end 

  def index
    if params[:format].present?
      @builder = Builder.find_by_id(params[:format])
      @properties = @builder.properties
    else
      @properties = current_builder.properties.where("published = #{true}")
    end
  end
  
  def show
    
    @property = Property.find(params[:id])
    @property.update_attributes(:full_view =>@property.full_view+1)
    @json = @property.to_gmaps4rails
    @contact = Contact.new
  end

  def new
    @builder = Builder.find params[:builder_id]
    @property = Property.new
    1.times {@property.images.build}
  end
  
  def create
    @builder = Builder.find params[:builder_id]
    @property = Property.new(params[:property])
    @property.builder_id = @builder.id
      
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
    end
    
    if params[:property][:property_status]=='Ready To Move'
      @property.start_date=""
      @property.upcoming_date=""
    elsif params[:property][:property_status]=='Ongoing'
      @property.upcoming_date="" 
    elsif params[:property][:property_status]=='Upcoming'
      @property.start_date=""
      @property.end_date=""
    end
    
    if @property.save
      @property.update_attribute(:published, false)
      flash[:notice]="property created successfully"
      redirect_to '/'
    else
      flash[:error] = "property creation failed"
      render 'new'
    end
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params[:property])
      redirect_to properties_path(@property)
    else
      #@property.errors.inspect
      render :action => :edit
    end
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end
  
  def manage_property
    @properties = Property.find params[:id]
    @properties.update_attribute(:published,params[:status])
    redirect_to manage_properties_admin_builder_path(@properties.builder)
  end

  def add_contact
    @contact = Contact.new
  end
  
  def post_contact
    @property = Property.find(params[:id])
    @title = "Contact"
    @contact = Contact.new(params[:contact].merge(:property_id => @property.id))
    @contact.builder_id = @property.builder_id
    if @contact.save
      ContactMailer.enquiry(@contact, @property).deliver
      redirect_to property_path(@property)
    else
      render :action => 'show'
    end
  end

  def summary
    @property = Property.find(params[:id])
  end

end
