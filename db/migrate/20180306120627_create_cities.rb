class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :budget
      t.string :location
      t.string :ype_of_evening
      t.string :type_of_city
      t.references :price_answer, foreign_key: true
      t.references :location_answer, foreign_key: true
      t.references :evening_answer, foreign_key: true
      t.references :city_type_answer, foreign_key: true

      t.timestamps
    end
  end
end
