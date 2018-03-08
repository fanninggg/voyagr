class AddColumnToLocationQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :location_questions, :asked, :boolean, :default=>false
  end
end
