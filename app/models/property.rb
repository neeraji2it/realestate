class Property < ActiveRecord::Base
  attr_accessible :builder_id,:property_name,:property_listing,:property_type,:no_of_flats,:no_of_floors,:no_of_houses,:no_of_plots,:state,:city,:address,:zip_code,:lat,:lng,:total_area,:saleable_area,:sale_price,:parking,:swimming,:playground,:party_hall,:property_status,:start_date,:end_date,:upcoming_date,:description
  validate :builder_id, :property_name, :property_listing, :property_type, :presence => true

  belongs_to :builder
  
   
end