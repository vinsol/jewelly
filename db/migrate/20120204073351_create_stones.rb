class CreateStones < ActiveRecord::Migration
  def self.up
    create_table :stones do |t|
      t.string :name
      t.integer :weight
      t.integer :rate_per_carat
      t.integer :price
      t.references :part

      t.timestamps
    end
  end

  def self.down
    drop_table :stones
  end
end
