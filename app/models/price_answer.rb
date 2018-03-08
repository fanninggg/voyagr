class PriceAnswer < ApplicationRecord
  belongs_to :price_question
  has_many :cities
  has_many :trip_answers

  scope :low, -> { where(content: 'low').first }
  scope :medium, -> { where(content: 'Medium').first }
  scope :expensive, -> { where(content: 'Expensive').first }
end
