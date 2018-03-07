class PriceQuestion < ApplicationRecord
  has_many :price_answers, dependent: :delete_all
end
