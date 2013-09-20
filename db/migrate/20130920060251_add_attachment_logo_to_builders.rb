class AddAttachmentLogoToBuilders < ActiveRecord::Migration
  def self.up
    change_table :builders do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :builders, :logo
  end
end
