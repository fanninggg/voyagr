class City < ApplicationRecord
  belongs_to :price_answer, optional: true
  belongs_to :location_answer, optional: true
  belongs_to :evening_answer, optional: true
  belongs_to :city_type_answer, optional: true
  has_many :trip_cities
end
