class AddColumnToCityTypeAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :city_type_answers, :answered, :boolean, :default=>false
  end
end
