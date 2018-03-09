class TripCity < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :trip_answer, optional: true
end
