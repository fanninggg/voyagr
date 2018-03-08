class Trip < ApplicationRecord
  belongs_to :user
  has_one :trip_answer
end
