class AddSenderToTripAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :trip_answers, :sender, :string
  end
end
