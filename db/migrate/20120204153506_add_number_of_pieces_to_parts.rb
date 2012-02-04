class AddNumberOfPiecesToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :number_of_pieces, :integer
  end

  def self.down
    remove_column :parts, :number_of_pieces
  end
end
