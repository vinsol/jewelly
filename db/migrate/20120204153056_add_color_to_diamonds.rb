class AddColorToDiamonds < ActiveRecord::Migration
  def self.up
    add_column :diamonds, :color, :string
  end

  def self.down
    remove_column :diamonds, :color
  end
end
