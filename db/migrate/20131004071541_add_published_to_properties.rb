class AddPublishedToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :published, :boolean,:default => false
  end
end
