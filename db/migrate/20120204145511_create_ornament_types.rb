class CreateOrnamentTypes < ActiveRecord::Migration
  def self.up
    create_table :ornament_types do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :ornament_types
  end
end
