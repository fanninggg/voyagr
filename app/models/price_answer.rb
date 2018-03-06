class PriceAnswer < ApplicationRecord
  belongs_to :price_question
  has_many :cities
  has_many :trip_answers
end
