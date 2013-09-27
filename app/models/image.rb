class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :builder
  belongs_to :property
  attr_accessible :builder_id, :property_id, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at  

  attr_accessor :destroy
  has_attached_file :image  
end