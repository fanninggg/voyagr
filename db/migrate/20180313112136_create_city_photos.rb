class CreateCityPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :city_photos do |t|
      t.string :photo
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
