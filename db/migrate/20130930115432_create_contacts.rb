class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :builder_id
      t.integer :property_id
      t.string :name
      t.string :email
      t.string :phone
      t.text :question
      t.string :option
      t.datetime :appointment_time
      t.timestamps
    end
  end
end