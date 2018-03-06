class TripCity < ApplicationRecord
  belongs_to :city
  belongs_to :trip_answer
end
