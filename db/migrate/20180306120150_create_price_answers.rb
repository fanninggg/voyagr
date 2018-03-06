class CreatePriceAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :price_answers do |t|
      t.string :content
      t.references :price_question, foreign_key: true

      t.timestamps
    end
  end
end
