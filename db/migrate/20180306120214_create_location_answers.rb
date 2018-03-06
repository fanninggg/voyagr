class CreateLocationAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :location_answers do |t|
      t.string :content
      t.references :location_question, foreign_key: true

      t.timestamps
    end
  end
end
