class CreateOrnaments < ActiveRecord::Migration
  def self.up
    create_table :ornaments do |t|
      t.string :name
      t.integer :finesse

      t.timestamps
    end
  end

  def self.down
    drop_table :ornaments
  end
end
