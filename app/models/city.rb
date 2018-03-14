class City < ApplicationRecord
  belongs_to :price_answer, optional: true
  belongs_to :location_answer, optional: true
  belongs_to :evening_answer, optional: true
  belongs_to :city_type_answer, optional: true
  has_many :trip_cities
  has_many :suggestions
  has_many :city_photos

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  serialize :top_attractions

end
