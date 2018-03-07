class CityTypeQuestion < ApplicationRecord
  has_many :city_type_answers, dependent: :delete_all
end
