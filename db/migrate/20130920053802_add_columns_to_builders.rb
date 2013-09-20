class AddColumnsToBuilders < ActiveRecord::Migration
  def change
    add_column :builders, :company_url, :string
  end
end