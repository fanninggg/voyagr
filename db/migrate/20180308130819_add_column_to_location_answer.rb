class AddColumnToLocationAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :location_answers, :answered, :boolean, :default=>false
  end
end
