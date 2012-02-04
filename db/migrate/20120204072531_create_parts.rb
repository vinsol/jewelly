class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :name
      t.float :net_weight
      t.float :gross_weight
      t.integer :labour
      t.references :ornament

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
