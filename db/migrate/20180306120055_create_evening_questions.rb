class CreateEveningQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :evening_questions do |t|
      t.string :content

      t.timestamps
    end
  end
end
