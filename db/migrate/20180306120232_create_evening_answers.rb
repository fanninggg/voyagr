class CreateEveningAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :evening_answers do |t|
      t.string :content
      t.references :evening_question, foreign_key: true

      t.timestamps
    end
  end
end
