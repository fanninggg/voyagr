class AddColumnToEveningAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :evening_answers, :answered, :boolean, :default=>false
  end
end
