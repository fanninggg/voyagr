class AddColumnToPriceAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :price_answers, :answered, :boolean, :default=>false
  end
end
