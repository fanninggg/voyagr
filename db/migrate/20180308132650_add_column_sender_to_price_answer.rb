class AddColumnSenderToPriceAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :price_answers, :sender, :string
  end
end
