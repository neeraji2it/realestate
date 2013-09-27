class Property < ActiveRecord::Base
  attr_accessible :builder_id,:property_name,:property_listing,:property_type,:no_of_flats,:no_of_floors,:images_attributes,:no_of_houses,:no_of_plots,:state,:city,:address,:zip_code,:latitude,:longitude,:total_area,:saleable_area,:sale_price,:parking,:swimming,:playground,:party_hall,:property_status,:start_date,:end_date,:upcoming_date,:description, :gmaps
  validates :builder_id, :property_name, :property_listing, :property_type,:property_status, :total_area,:saleable_area,:sale_price,:presence => true
  
  belongs_to :builder  
  has_many :images     
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
  validates_format_of :zip_code,
                  with: /\A\d{6}-\d{5}|\A\d{6}\z/,
                  message: "should be 123456 or 12345-1234",
                  allow_blank: false
 #acts_as_gmappable
acts_as_gmappable :process_geocoding => false

  def gmaps4rails_address
 
  "#{self.address}, #{self.city}, #{self.zip_code}" 
  
  end
end