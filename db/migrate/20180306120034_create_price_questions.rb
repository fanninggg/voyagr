class CreatePriceQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :price_questions do |t|
      t.string :content

      t.timestamps
    end
  end
end
