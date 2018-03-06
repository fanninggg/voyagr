class CreateLocationQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :location_questions do |t|
      t.string :content

      t.timestamps
    end
  end
end
