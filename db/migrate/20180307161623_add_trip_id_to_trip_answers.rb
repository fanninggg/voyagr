class AddTripIdToTripAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :trip_answers, :trip, foreign_key: true
  end
end
