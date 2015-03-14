class AddPicToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :pic, :json
  end
end
