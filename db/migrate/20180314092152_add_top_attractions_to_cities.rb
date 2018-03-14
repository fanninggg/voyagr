class AddTopAttractionsToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :top_attractions, :string
  end
end
