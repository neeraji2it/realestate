class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
       t.integer :builder_id
       t.string :property_name
       t.string :property_listing
       t.string :property_type
       t.integer :no_of_flats
       t.integer :no_of_floors
       t.integer :no_of_houses
       t.integer :no_of_plots
       t.string :state
       t.string :city
       t.text :address
       t.string :zip_code
       t.string :lat
       t.string :lng
       t.string :total_area
       t.string :saleable_area
       t.string :sale_price
       t.integer :parking
       t.integer :swimming
       t.integer :playground
       t.integer :party_hall
       t.string :property_status
       t.date :start_date
       t.date :end_date
       t.date :upcoming_date
       t.text :description
      t.timestamps
    end
  end
end
