class AddColumnSenderToPriceQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :price_questions, :sender, :string
  end
end
