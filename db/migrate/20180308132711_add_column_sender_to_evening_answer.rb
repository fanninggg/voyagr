class AddColumnSenderToEveningAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :evening_answers, :sender, :string
  end
end
