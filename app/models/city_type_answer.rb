class CityTypeAnswer < ApplicationRecord
  belongs_to :city_type_question
  has_many :cities
  has_many :trip_answers
end
