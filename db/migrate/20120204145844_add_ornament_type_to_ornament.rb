class AddOrnamentTypeToOrnament < ActiveRecord::Migration
  def self.up
    add_column :ornaments, :ornament_type_id, :integer
  end

  def self.down
    remove_column :ornaments, :ornament_type_id
  end
end
