class AddApprovedToBuilders < ActiveRecord::Migration
  def change
    add_column :builders, :approved, :boolean
  end
end
