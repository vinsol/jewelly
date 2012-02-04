class AddLabourToOrnament < ActiveRecord::Migration
  def self.up
    add_column :ornaments, :labour, :integer
  end

  def self.down
    remove_column :ornaments, :labour
  end
end
