class AddAttachmentImageToMalls < ActiveRecord::Migration
  def self.up
    change_table :malls do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :malls, :image
  end
end
