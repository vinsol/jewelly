class AddCodeToOrnament < ActiveRecord::Migration
  def self.up
    add_column :ornaments, :code, :string
  end

  def self.down
    remove_column :ornaments, :code
  end
end
