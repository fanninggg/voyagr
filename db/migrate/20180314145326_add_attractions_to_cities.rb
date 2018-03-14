class AddAttractionsToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :top_attractions_1, :string
    add_column :cities, :top_attractions_2, :string
    add_column :cities, :top_attractions_3, :string
  end
end
