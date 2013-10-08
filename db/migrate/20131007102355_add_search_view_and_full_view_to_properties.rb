class AddSearchViewAndFullViewToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :search_view, :integer,:default => 0
    add_column :properties, :full_view, :integer,:default => 0
  end
end
