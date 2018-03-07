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
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427422/voyagr/Venice.jpg"
  },
  {
    name: 'Seville, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:   'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427346/voyagr/Seville.jpg"
  },
    {
    name: 'Santorini, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:   'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427331/voyagr/Santorini.jpg"
  },
    {
    name: ' Rio De Janeiro, Brazil',
    budget:         'Medium',
    location:      'Outside',
    type_of_evening:  'Bar',
    type_of_city:   'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427292/voyagr/Rio.jpg"
  },
    {
    name: 'Gdansk, Poland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426892/voyagr/Gdansk.jpg"
  },
     {
    name: 'Canary Islands, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426780/voyagr/Canary_Islands.jpg"
  },   {
    name: 'Dublin, Ireland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426869/voyagr/Dublin.jpg"
  },   {
    name: 'Budapest, Hungary',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426756/voyagr/Budapest.jpg"
  },   {
    name: 'Berlin, Germany',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426671/voyagr/Berlin.jpg"
  },
  {
    name: ' Prague, Czech Republic',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427263/voyagr/Prague.jpg"
  },
  {
    name: 'Dubrovnik, Croatia',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426874/voyagr/Dubrovnik.jpg"
  },
   {
    name: 'Krakow, Poland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427018/voyagr/Krakow.jpg"
  },
    {
    name: 'Madeira, Portugal',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427105/voyagr/Madiera.jpg"
  },
  {
    name: 'Stari Grad, Croatia',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427376/voyagr/Stari_Grad.jpg"
  },
  {
    name: 'Malta Island, Malta',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427113/voyagr/Malta_Island.jpg"
  },
   {
    name: 'Glasgow, UK',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426900/voyagr/Glasgow.jpg"
  },
   {
    name: 'Sarajevo, Bosnia and Herzegovina',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427335/voyagr/Sarajevo.jpg"
  },
   {
    name: 'Prague, Czech Republic',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427263/voyagr/Prague.jpg"
  },
   {
    name: 'Bruges, Belgium',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426737/voyagr/Bruges.jpg"
  },
   {
    name: 'Brighton, UK',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426721/voyagr/Brighton.jpg"
  },
 {
    name: 'Vienna, Austria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427430/voyagr/Vienna.jpg"
  },
 {
    name: 'Madeira, Portugal',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427105/voyagr/Madiera.jpg"
  },
   {
    name: 'Canary Islands, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426780/voyagr/Canary_Islands.jpg"
  },
   {
    name: 'Kotor, Montenegro',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427011/voyagr/Kotor.jpg"
  },
     {
    name: 'Sofia, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520436347/voyagr/Sofia.jpg"
  },
     {
    name: 'Minsk, Belarus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427144/voyagr/Minsk.jpg"
  },
     {
    name: 'Madrid, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427109/voyagr/Madrid.jpg"
  },
   {
    name: 'Sozopol, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427363/voyagr/Sozopol.jpg"
  },
  {
    name: 'Granada, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426919/voyagr/Grenada.jpg"
  },
  {
    name: 'Paphos, Cyprus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427242/voyagr/Paphos.jpg"
  },
   {
    name: 'Sozopol, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427363/voyagr/Sozopol.jpg"
  },
   {
    name: 'Granada, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426919/voyagr/Grenada.jpg"
  },
   {
    name: 'Paphos, Cyprus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427242/voyagr/Paphos.jpg"
  },
     {
    name: ' Cartagena, Colombia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426804/voyagr/Cartagena.jpg"
  },
    {
    name: 'Bangkok, Thailand',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426655/voyagr/Bangkok.jpg"
  },
    {
    name: ' Antigua Guatemala, Guatemala',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426641/voyagr/Antigua.jpg"
  },
 {
    name: 'Cusco, Peru',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426861/voyagr/Cusco.jpg"
  },
   {
    name: 'Valparaiso, Chile',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427409/voyagr/Valparaiso.jpg"
  },
   {
    name: 'Kuala Lumpa, Malaysia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427033/voyagr/Kuala-Lumpur.jpg"
  },
   {
    name: 'Boracay, Philippines',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520433047/voyagr/Boracay.jpg"
  },
   {
    name: 'Recife, Brazil',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427275/voyagr/Recife.jpg"
  },
   {
    name: 'Bogota, Columbia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426700/voyagr/Bogota.jpg"
  },
    {
    name: 'Delhi, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426863/voyagr/Delhi.jpg"
  },
  {
    name: 'Oaxaca, Mexico',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427222/voyagr/Oaxaca.jpg"
  },
  {
    name: 'Addis Ababa, Ethiopia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426633/voyagr/Addis_Ababa.jpg"
  },
   {
    name: 'Mumbai, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427188/voyagr/Mumbai.jpg"
  },
    {
    name: 'Angkor Wat, Cambodia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426638/voyagr/Angkor_Wat.jpg"
  },
    {
    name: 'Casablanca, Morocco',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426811/voyagr/Casablanca.jpg"
  },
 {
    name: 'Tunis, Tunisia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427404/voyagr/Tunis.jpg"
  },
 {
    name: 'Cancun, Mexico',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426783/voyagr/Cancun.jpg"
  },
 {
    name: 'Jaipur, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426993/voyagr/Jaipur.jpg"
  },
  {
    name: 'Lahore, Pakistan',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427060/voyagr/Lahore.jpg"
  },
  {
    name: 'Caracas, Venezuela',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426796/voyagr/Caracas.jpg"
  },
  {
    name: 'Tehran, Iran',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427398/voyagr/Tehran.jpg"
  },
  {
    name: 'Angkor Wat, Cambodia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426638/voyagr/Angkor_Wat.jpg"
  },
  {
    name: 'Colombo, Sri Lanka',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426829/voyagr/Colombo.jpg"
  },
  {
    name: 'Hội An, Vietnam',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426949/voyagr/Hoi_An.jpg"
  },
  {
    name: 'Montevideo, Uruguay',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427166/voyagr/Montevideo.jpg"
  },
  {
    name: 'Vientiane, Laos',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427435/voyagr/Vientiane.jpg"
  },
   {
    name: 'Dublin, Ireland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426869/voyagr/Dublin.jpg"
  },
    {
    name: 'Ibiza, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426968/voyagr/Ibiza.jpg"
  },
    {
    name: 'Bonifacio, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426704/voyagr/Bonifacio.jpg"
  },
    {
    name: 'Vienna, Austria',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427430/voyagr/Vienna.jpg"
  },
      {
    name: 'Cambridge, England',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426775/voyagr/Cambridge.jpg"
  },
      {
    name: 'Barcelona, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426659/voyagr/Barcelona.jpg"
  },
    {
    name: 'Bilbao, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426677/voyagr/Bilbao.jpg"
  },
  {
    name: 'Lyon, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427094/voyagr/Lyon.jpg"
  },
  {
    name: 'Bratislava, Slovakia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426709/voyagr/Bratislava.jpg"
  },
    {
    name: 'Lisbon, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427072/voyagr/Lisbon.jpg"
  },
   {
    name: 'Mont Saint Michel, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427151/voyagr/Mont_Saint_Michel.jpg"
  },
   {
    name: 'Krk, Croatia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427024/voyagr/Krk.jpg"
  },
    {
    name: 'Athens, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426643/voyagr/Athens.jpg"
  },
  {
    name: 'Milan, Italy',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427140/voyagr/Milan.jpg"
  },
  {
    name: 'Bucharest, Romania',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426750/voyagr/Bucharest.jpg"
  },
    {
    name: 'Lyon, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427094/voyagr/Lyon.jpg"
  },
     {
    name: 'Santorini, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427331/voyagr/Santorini.jpg"
  },
   {
    name: 'Porto, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427258/voyagr/Porto.jpg"
  },
    {
    name: 'La Grave, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427045/voyagr/La_Grave.jpg"
  },
    {
    name: 'Isle of Skye, UK',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426976/voyagr/Isle_of_Skye.jpg"
  },
   {
    name: 'Lisbon, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427072/voyagr/Lisbon.jpg"
  },
   {
    name: 'Munich, Germany',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427200/voyagr/Munich.jpg"
  },
   {
    name: 'Burgos, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426769/voyagr/Burgos.jpg"
  },
   {
    name: 'Cork, Ireland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426845/voyagr/Cork.jpg"
  },
     {
    name: 'Split, Croatia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427367/voyagr/Split.jpg"
  },
     {
    name: 'Helsinki, Finland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426951/voyagr/Helsinki.jpg"
  },
   {
    name: 'Rio De Janeiro, Brazil',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427292/voyagr/Rio.jpg"
  },
     {
    name: 'Chicago, Illinois',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426820/voyagr/Chicago.jpg"
  },
     {
    name: 'Moorea, Tahiti',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427182/voyagr/Moorea.jpg"
  },
     {
    name: 'Nairobi, Kenya',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427205/voyagr/Nairobi.jpg"
  },
    {
    name: 'St. Petersburg, Russia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427371/voyagr/St._Petersburg.jpg"
  },
  {
    name: 'Montreal, Canada',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427173/voyagr/Montreal.jpg"
  },
       {
    name: 'Montego Bay, Jamaica',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427160/voyagr/Montego_Bay.jpg"
  },

     {
    name: 'Suva, Fiji',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427388/voyagr/Suva.jpg"
  },
  {
    name: 'Beirut, Lebanon',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426666/voyagr/Beirut.jpg"
  },
   {
    name: ' Burlington, US',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426627/voyagr/Burlington.jpg"
  },
   {
    name: 'Jakarta, Indonesia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426998/voyagr/Jakarta.jpg"
  },
   {
    name: ' Istanbul, Turkey',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426990/voyagr/Istanbul.jpg"
  },
    {
    name: 'Buenos Aires, Argentina',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426764/voyagr/Buenos_Aires.jpg"
  },
    {
    name: 'Beijing, China',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426663/voyagr/Beijing.jpg"
  },
   {
    name: 'Marrakech, Moroccoa',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427122/voyagr/Marrakech.jpg"
  },
    {
    name: 'Hamilton, Burmuda',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426933/voyagr/Hamilton.jpg"
  },
    {
    name: 'Papeete, Bora Bora',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427235/voyagr/Papeete.jpg"
  },
      {
    name: 'Kathmandu, Nepal',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427003/voyagr/Kathmandu.jpg"
  },
  {
    name: 'Zanzibar, Tanzania',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427474/voyagr/Zanzibar.jpg"
  },
  {
    name: 'Samarkand, Uzbekistan',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427317/voyagr/Samarkand.jpg"
  },
   {
    name: 'Petra, Jordan',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427252/voyagr/Petra.jpg"
  },
   {
    name: 'Lalibela, Ethiopia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427059/voyagr/Lalibela.jpg"
  },
   {
    name: 'Beijing, China',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426663/voyagr/Beijing.jpg"
  },
   {
    name: 'Cape Town, South Africa',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426787/voyagr/Cape_Town.jpg"
  },
  {
    name: 'Honolulu, Hawaii',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426961/voyagr/Honolulu.jpg"
  },
  {
    name: 'Papeete, Bora Bora',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427235/voyagr/Papeete.jpg"
  },
 {
    name: 'Chamonix, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426820/voyagr/Chamonix.jpg"
  },
   {
    name: 'Lucerne, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427091/voyagr/Lucerne.jpg"
  },
   {
    name: 'Capri, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426792/voyagr/Capri.jpg"
  },
 {
    name: 'London, England',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427081/voyagr/London.jpg"
  },
   {
    name: 'Florence, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426884/voyagr/Florence.jpg"
  },
   {
    name: 'Paris, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427247/voyagr/Paris.jpg"
  },
   {
    name: 'Geneva, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426896/voyagr/Geneva.jpg"
  },
   {
    name: 'Manchester, UK',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427117/voyagr/Manchester.jpg"
  },
   {
    name: 'Nice, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427216/voyagr/Nice.jpg"
  },
   {
    name: 'Mont Saint Michel, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427151/voyagr/Mont_Saint_Michel.jpg"
  },
   {
    name: 'Lausanne, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427066/voyagr/Lausanne.jpg"
  },
   {
    name: 'Bergen, Norway',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426669/voyagr/Bergen.jpg"
  },
    {
    name: 'Vatican City',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427416/voyagr/Vatican_City.jpg"
  },
    {
    name: 'Amsterdam, Netherlands',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426635/voyagr/Amsterdam.jpg"
  },
    {
    name: 'Rome, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427308/voyagr/Rome.jpg"
  },
   {
    name: 'Copenhagen, Denmark',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426835/voyagr/Copenhagen.jpg"
  },
   {
    name: 'Zurich, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427480/voyagr/Zurich.jpg"
  },
   {
    name: 'Wild Taiga, Finland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427462/voyagr/Wild_Taiga.jpg"
  },
   {
    name: 'Edinburgh, Scotland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426880/voyagr/Edinburgh.jpg"
  },
   {
    name: 'Gothenburg, Sweden',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426905/voyagr/Gothenburg.jpg"
  },
   {
    name: 'Stockholm, Sweden',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427381/voyagr/Stockholm.jpg"
  },
   {
    name: 'Brussels, Belgium',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426746/voyagr/Brussels.jpg"
  },
   {
    name: 'Maastricht, The Netherlands',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427100/voyagr/Maastricht.jpg"
  },
   {
    name: 'Rotterdam, Netherlands ',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427313/voyagr/Rotterdam.png"
  },
   {
    name: 'Oslo, Norway',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427230/voyagr/Oslo.jpg"
  },
   {
    name: 'Reykjavik, Iceland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427281/voyagr/Reykjavik.jpg"
  },
  {
    name: 'Havana, Cuba',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426939/voyagr/Havana.jpg"
  },
  {
    name: 'Queenstown, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427269/voyagr/Queenstown.jpg"
  },
  {
    name: 'Melbourne, Australia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427133/voyagr/Melbourne.jpg"
  },
   {
    name: 'Bangkok, Thailand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426655/voyagr/Bangkok.jpg"
  },
   {
    name: 'Osaka, Japan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427227/voyagr/Osaka.jpg"
  },
   {
    name: 'Shanghai, China',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427350/voyagr/Shanghai.jpg"
  },
  {
    name: 'Sydney, Australia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427391/voyagr/Sydney.jpg"
  },
  {
    name: 'Vancouver, Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427413/voyagr/Vancouver.jpg"
  },
  {
    name: 'San Diego, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427324/voyagr/San_Diego.jpg"
  },
  {
    name: 'San Francisco, United States',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427328/voyagr/San_Francisco.jpg"
  },
  {
    name: 'Bali, Indonesia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426647/voyagr/Bali.jpg"
  },
  {
    name: 'Niagara Falls, US/ Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427212/voyagr/Niagara_Falls.jpg"
  },
   {
    name: 'Taipei, Taiwan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427395/voyagr/Taipei.jpg"
  },
   {
    name: 'Ulan Bator, Mongolia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427406/voyagr/Ulan_Bator.jpg"
  },
   {
    name: 'Seoul, South Korea',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427339/voyagr/Seoul.jpg"
  },
  {
    name: 'Washington DC, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427443/voyagr/Washington_DC.jpg"
  },
  {
    name: 'Dubai, United Arab Emirates',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426630/voyagr/Dubai.jpg"
  },
  {
    name: 'Bern, Switzerland',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426673/voyagr/Bern.jpg"
  },
  {
    name: 'Auckland, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426645/voyagr/Auckland.jpg"
  },
  {
    name: 'Grand Canyon, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426913/voyagr/Grand_Canyon.jpg"
  },
  {
    name: 'Banff, Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426653/voyagr/Banff.jpg"
  },
   {
    name: 'Kyoto, Japan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427039/voyagr/Kyoto.jpg"
  },
   {
    name: 'Wellington, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427452/voyagr/Wellington.jpg"
  },
   {
    name: 'Hong Kong',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426955/voyagr/Hong_Kong.jpg"
  },
   {
    name: 'Victoria, Seychelles',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427426/voyagr/Vicroria.jpg"
  },
   {
    name: 'Honolulu, Hawaii',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426961/voyagr/Honolulu.jpg"
  },
   {
    name: 'Dubai, UAE',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426630/voyagr/Dubai.jpg"
  }
]

City.create!(cities_attributes)

puts "done"

