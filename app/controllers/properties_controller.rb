class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(params[:property])
    if @property.save
      flash[:notice] = "sucessfully saved!"
      redirect_to '/'
    else
      render 'new'
    end
    
  end

  def show
    
  end
end
