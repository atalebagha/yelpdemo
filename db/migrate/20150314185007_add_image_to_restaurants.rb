class AddImageToRestaurants < ActiveRecord::Migration
  def self.up
    add_attachment :restaurants, :image
  end

  def self.down
    remove_attachment :restaurants, :image
  end
end
