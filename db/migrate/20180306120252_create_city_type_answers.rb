class CreateCityTypeAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :city_type_answers do |t|
      t.string :content
      t.references :city_type_question, foreign_key: true

      t.timestamps
    end
  end
end
