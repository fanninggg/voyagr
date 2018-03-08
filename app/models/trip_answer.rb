class TripAnswer < ApplicationRecord
  belongs_to :price_answer, optional: true
  belongs_to :location_answer, optional: true
  belongs_to :evening_answer, optional: true
  belongs_to :city_type_answer, optional: true
  belongs_to :trip
  validates :sender, presence: true
end
