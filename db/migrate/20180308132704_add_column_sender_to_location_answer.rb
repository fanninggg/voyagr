class AddColumnSenderToLocationAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :location_answers, :sender, :string
  end
end
