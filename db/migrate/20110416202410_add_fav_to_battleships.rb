class AddFavToBattleships < ActiveRecord::Migration
  def self.up
    add_column :battleships, :favorate, :boolean
  end

  def self.down
    remove_column :battleships, :favorate
  end
end
