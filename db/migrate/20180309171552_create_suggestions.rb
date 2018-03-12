class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.references :city, foreign_key: true
      t.string :name
      t.string :type
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
