class CreateConfs < ActiveRecord::Migration
  def self.up
    create_table :confs do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :confs
  end
end
