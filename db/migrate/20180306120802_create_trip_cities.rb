class CreateTripCities < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_cities do |t|
      t.references :city, foreign_key: true
      t.references :trip_answer, foreign_key: true

      t.timestamps
    end
  end
end
