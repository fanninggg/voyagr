class Trip < ApplicationRecord
  validates :sender, presence: true
  has_one :trip_answer, dependent: :destroy
end
