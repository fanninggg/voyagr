class AddColumnSenderToEveningQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :evening_questions, :sender, :string
  end
end
