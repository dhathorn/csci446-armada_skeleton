class AddFavToBattleships < ActiveRecord::Migration
  def self.up
    add_column :battleships, :favorite, :boolean, :default => false
  end

  def self.down
    remove_column :battleships, :favorite
  end
end
