class LocationQuestion < ApplicationRecord
  has_many :location_answers, dependent: :delete_all
end
