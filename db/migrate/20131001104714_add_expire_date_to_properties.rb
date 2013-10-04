class AddExpireDateToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :expire_date, :date
  end
end
