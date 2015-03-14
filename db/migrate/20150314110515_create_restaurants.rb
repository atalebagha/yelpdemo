class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
