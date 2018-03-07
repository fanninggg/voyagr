class AddNulltoForeignKeys < ActiveRecord::Migration[5.1]

  remove_reference :cities, :price_answer, foreign_key: true
  remove_reference :cities, :location_answer, foreign_key: true
  remove_reference :cities, :evening_answer, foreign_key: true
  remove_reference :cities, :city_type_answer, foreign_key: true
  add_reference :cities, :price_answer, foreign_key: true, null: true
  add_reference :cities, :location_answer, foreign_key: true, null: true
  add_reference :cities, :evening_answer, foreign_key: true, null: true
  add_reference :cities, :city_type_answer, foreign_key: true, null: true

end
