class AddDescriptionToOrnament < ActiveRecord::Migration
  def self.up
    add_column :ornaments, :description, :text
  end

  def self.down
    remove_column :ornaments, :description
  end
end
