class EveningAnswer < ApplicationRecord
  belongs_to :evening_question
  has_many :cities
  has_many :trip_answers
end
