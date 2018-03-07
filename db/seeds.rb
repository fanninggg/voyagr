# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# PriceQuestion.destroy_all
# LocationQuestion.destroy_all
# EveningQuestion.destroy_all
# CityTypeQuestion.destroy_all
puts "Seeding"

price_questions_attributes =
{
  content: 'How much do you want to spend?'
  }
price = PriceQuestion.create!(price_questions_attributes)

location_questions_attributes =
{content: 'Do you want to travel in Europe or go further?'
  }

location = LocationQuestion.create!(location_questions_attributes)

evening_questions_attributes =
{
  content: 'What would be your perfect evening on holidays?'
  }

evening = EveningQuestion.create!(evening_questions_attributes)

city_type_attributes =
{
  content: 'What kind of holiday do you want ?'
  }
city_type = CityTypeQuestion.create!(city_type_attributes)


price_answers_attributes = {
  price_question_id: price.id,
  content: ["low", "medium", "Expensive"]
}

PriceAnswer.create!(price_answers_attributes)


location_answers_attributes = {
  location_question_id: location.id,
  content: ['Europe', 'Worldwide']
  }

LocationAnswer.create!(location_answers_attributes)

evening_answers_attributes = {
  evening_question_id: evening.id,
  content: ['Bar', 'Restaurant','Meet the locals']
}

EveningAnswer.create!(evening_answers_attributes)

city_type_answers_attributes = {
  city_type_question_id: city_type.id,
  content: ['Culturous', 'Adventurous', 'Relaxing']
}
CityTypeAnswer.create!(city_type_answers_attributes)

puts "Now for the cities"


cities_attributes = [
  {
    name: 'Venice, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Cultural'
  },
  {
    name: 'Seville, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:   'Cultural'
  },
    {
    name: 'Santorini, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:   'Relaxing'
  },
    {
    name: ' Rio De Janeiro, Brazil',
    budget:         'Medium',
    location:      'Outside',
    type_of_evening:  'Bar',
    type_of_city:   'Adventurous'
  },
    {
    name: 'Gdansk, Poland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
     {
    name: 'Canary Islands, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },   {
    name: 'Dublin, Ireland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },   {
    name: 'Budapest, Hungary',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },   {
    name: 'Berlin, Germany',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
  {
    name: ' Prague, Czech Republic',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
  {
    name: 'Dubrovnik, Croatia',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Krakow, Poland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
    {
    name: 'Madeira, Portugal',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Stari Grad, Croatia',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Malta Island, Malta',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Glasgow, UK',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Sarajevo, Bosnia and Herzegovina',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Prague, Czech Republic',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Bruges, Belgium',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Brighton, UK',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
 {
    name: 'Vienna, Austria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
 {
    name: 'Madeira, Portugal',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Canary Islands, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Kotor, Montenegro',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
     {
    name: 'Sofia, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
     {
    name: 'Minsk, Belarus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
     {
    name: 'Madrid, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Sozopol, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Granada, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Paphos, Cyprus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Sozopol, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Granada, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Paphos, Cyprus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
     {
    name: ' Cartagena, Colombia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Bangkok, Thailand',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
    {
    name: ' Antigua Guatemala, Guatemala',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
 {
    name: 'Cusco, Peru',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Valparaiso, Chile',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Kuala Lumpa, Malaysia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Boracay, Philippines',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Recife, Brazil',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Bogota, Columbia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Bogota, Columbia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
    {
    name: 'Delhi, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Oaxaca, Mexico',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Addis Ababa, Ethiopia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Mumbai, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Angkor Wat, Cambodia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Casablanca, Morocco',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
 {
    name: 'Tunis, Tunisia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
 {
    name: 'Cancun, Mexico',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
 {
    name: 'Jaipur, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Lahore, Pakistan',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  }, {
    name: 'Caracas, Venezuela',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Tehran, Iran',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
  {
    name: 'Angkor, Cambodia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
  {
    name: 'Colombo, Sri Lanka',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Hội An, Vietnam',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Montevideo, Uruguay',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Vientiane, Laos',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Dublin, Ireland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Ibiza, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Bonifacio, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Vienna, Austria',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
      {
    name: 'Cambridge, England',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
      {
    name: 'Barcelona, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
    {
    name: 'Bilbao, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Lyon, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Bratislava, Slovakia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
    {
    name: 'Lisbon, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Mont Saint Michel, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Krk, Croatia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Athens, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
  {
    name: 'Milan, Italy',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
  {
    name: 'Bucharest, Romania',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Lyon, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
     {
    name: 'Santorini, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Porto, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
    {
    name: 'La Grave, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Isle of Skye, UK',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Lisbon, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Munich, Germany',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Burgos, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Cork, Ireland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
     {
    name: 'Split, Croatia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
     {
    name: 'Helsinki, Finland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Rio De Janeiro, Brazil',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
     {
    name: 'Chicago, Illinois',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
     {
    name: 'Moorea, Tahiti',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
     {
    name: 'Nairobi, Kenya',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
    {
    name: 'St. Petersburg, Russia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
    {
    name: 'Machu Picchu, Peru',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
     {
    name: 'Montreal, Canada',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
       {
    name: 'Montego Bay, Jamaica',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },

     {
    name: 'Suva, Fiji',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Beirut, Lebanon',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: ' Burlington, US',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Jakarta, Indonesia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: ' Istanbul, Turkey',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Buenos Aires, Argentina',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Beijing, China',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Marrakech, Moroccoa',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
    {
    name: 'Hamilton, Burmuda',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
    {
    name: 'Papeete, Bora Bora',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
      {
    name: 'Kathmandu, Nepal',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Zanzibar, Tanzania',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Samarkand, Uzbekistan',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Petra, Jordan',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Lalibela, Ethiopia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Beijing, China',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Cape Town, South Africa',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Honolulu, Hawaii',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Papeete, Bora Bora',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
 {
    name: 'Chamonix, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Lucerne, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Capri, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
 {
    name: 'London, England',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Florence, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Paris, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Geneva, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Manchester, UK',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Nice, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Mont Saint Michel, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Lausanne, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Bergen, Norway',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
    {
    name: 'Vatican City',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Amsterdam, Netherlands',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
    {
    name: 'Rome, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Copenhagen, Denmark',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Zurich, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Wild Taiga, Finland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Edinburgh, Scotland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Gothenburg, Sweden',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Stockholm, Sweden',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Brussels, Belgium',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Maastricht, The Netherlands',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Rotterdam, Netherlands ',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Oslo, Norway',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Reykjavik, Iceland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Havana, Cuba',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Queenstown, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Melbourne, Australia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Bangkok, Thailand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Osaka, Japan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
   {
    name: 'Shanghai, China',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous'
  },
  {
    name: 'Sydney, Australia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Vancouver, Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
  {
    name: 'San Diego, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing'
  },
  {
    name: 'San Francisco, United States',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Bali, Indonesia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Niagara Falls, US/ Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Taipei, Taiwan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Ulan Bator, Mongolia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
   {
    name: 'Seoul, South Korea',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous'
  },
  {
    name: 'Washington DC, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Dubai, United Arab Emirates',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Bern, Switzerland',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing'
  },
  {
    name: 'Auckland, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Grand Canyon, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
  {
    name: 'Moraine Lake, Banff, Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous'
  },
   {
    name: 'Kyoto, Japan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Wellington, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Hong Kong',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous'
  },
   {
    name: 'Victoria, Seychelles',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Honolulu, Hawaii',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  },
   {
    name: 'Dubai, UAE',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing'
  }
]

City.create!(cities_attributes)

puts "done"

