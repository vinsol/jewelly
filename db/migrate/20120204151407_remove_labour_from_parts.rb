class RemoveLabourFromParts < ActiveRecord::Migration
  def self.up
    remove_column :parts, :labour
  end

  def self.down
    add_column :parts, :labour, :integer
  end
end
