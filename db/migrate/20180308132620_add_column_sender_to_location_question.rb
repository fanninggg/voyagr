class AddColumnSenderToLocationQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :location_questions, :sender, :string
  end
end
