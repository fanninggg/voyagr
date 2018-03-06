class CreateCityTypeQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :city_type_questions do |t|
      t.string :content

      t.timestamps
    end
  end
end
