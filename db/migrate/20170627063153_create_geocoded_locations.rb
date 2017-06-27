class CreateGeocodedLocations < ActiveRecord::Migration
  def change
    create_table :geocoded_locations do |t|
      t.decimal :longitude, :precision => 15, :scale => 13
      t.decimal :latitude, :precision => 15, :scale => 13
      t.string :address

      t.timestamps null: false
    end
  end
end
