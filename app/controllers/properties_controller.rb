class PropertiesController < ApplicationController
  before_filter :is_builder?
  
  def index
    before_filter :allow_currentuser, :only=>[:edit, :destroy]
    def allow_currentuser
      @property=Property.find(params[:id])
      unless @property.builder_id==current_builder.id
        flash[:notice]="access denied"
        redirect_to properties_path
      end
    end
    def index
      @properties = Property.all
    end

    def new
      @property = Property.new
    end
  
    def create
      @property = Property.new(params[:property].merge(:builder_id => current_builder.id ))
      if @property.save
        flash[:notice] = "sucessfully saved!"
        redirect_to properties_path
      else
        render 'new'
      end    
    end
  
    def edit
      @property = Property.find(params[:id])
    end
  
    def show
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
