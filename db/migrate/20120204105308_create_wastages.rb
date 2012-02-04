class CreateWastages < ActiveRecord::Migration
  def self.up
    create_table :wastages do |t|
      t.integer :from
      t.integer :to
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :wastages
  end
end
