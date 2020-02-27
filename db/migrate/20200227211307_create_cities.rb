class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.float :city_latitude
      t.float :city_longitude

      t.timestamps
    end
  end
end
