class LocationAnswer < ApplicationRecord
  belongs_to :location_question
  has_many :cities
  has_many :trip_answers
end
