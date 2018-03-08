class AddColumnToCityTypeQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :city_type_questions, :asked, :boolean, :default=>false
  end
end
