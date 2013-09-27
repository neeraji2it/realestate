class Property < ActiveRecord::Base
  attr_accessible :builder_id,:property_name,:property_listing,:property_type,:no_of_flats,:no_of_floors,:images_attributes,:no_of_houses,:no_of_plots,:state,:city,:address,:zip_code,:latitude,:longitude,:total_area,:saleable_area,:sale_price,:parking,:swimming,:playground,:party_hall,:property_status,:start_date,:end_date,:upcoming_date,:description, :gmaps
  validate :builder_id, :property_name, :property_listing, :property_type, :presence => true
  belongs_to :builder  
  has_many :images     
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
  
  acts_as_gmappable
  
  def gmaps4rails_address
    "#{self.zip_code}"
  end
  
  define_index do
    indexes property_listing
    indexes property_type
    indexes sale_price
    indexes city
  end
  
  def gmaps4rails_infowindow
    "Address: #{self.address} <br/> City: #{self.city} <br /> Longitude: #{self.longitude} <br/> Latitude: #{self.latitude}"
  end
    
end