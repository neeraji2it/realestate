class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
        t.integer :builder_id
        t.integer :property_id
      t.timestamps
    end
  end
end
