class AddColumnToEveningQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :evening_questions, :asked, :boolean, :default=>false
  end
end
