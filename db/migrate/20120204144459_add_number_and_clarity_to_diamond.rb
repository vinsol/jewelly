class AddNumberAndClarityToDiamond < ActiveRecord::Migration
  def self.up
#    add_column :diamonds, :number, :integer
    add_column :diamonds, :clarity, :string
  end

  def self.down
    remove_column :diamonds, :clarity
    remove_column :diamonds, :number
  end
end
