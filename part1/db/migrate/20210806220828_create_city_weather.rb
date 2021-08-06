class CreateCityWeather < ActiveRecord::Migration[6.1]
  def change
    create_table :city_weathers do |t|
      t.string :city_name
      t.string :weather
      t.string :description
      t.float :temperature
      t.jsonb :payload
      t.timestamps
    end
  end
end
