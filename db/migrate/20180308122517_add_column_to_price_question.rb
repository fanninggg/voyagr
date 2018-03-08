class AddColumnToPriceQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :price_questions, :asked, :boolean, :default=>false
  end
end
