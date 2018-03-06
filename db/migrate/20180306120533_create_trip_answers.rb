class CreateTripAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_answers do |t|
      t.references :price_answer, foreign_key: true
      t.references :location_answer, foreign_key: true
      t.references :evening_answer, foreign_key: true
      t.references :city_type_answer, foreign_key: true

      t.timestamps
    end
  end
end
