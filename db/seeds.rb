# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cities_attributes = [
  {
    name: 'Venice, Italy'
    budget:         'high',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Cultural'
  },
  {
    name: 'Seville, Spain'
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:   'Cultural'
  },
    {
    name: 'Santorini, Greece'
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:   'Relaxing'
  },
    {
    name: ' Rio De Janeiro, Brazil'
    budget:         'Medium',
    location:      'Outside',
    type_of_evening:  'Bar',
    type_of_city:   'Adventurous'
  },
]

City.create!(cities_attributes)



