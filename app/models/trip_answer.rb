class TripAnswer < ApplicationRecord
  belongs_to :price_answer
  belongs_to :location_answer
  belongs_to :evening_answer
  belongs_to :city_type_answer
  has_many :trip_answers
end
