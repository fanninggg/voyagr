require 'json'
require 'open-uri'

Suggestion.destroy_all
CityPhoto.destroy_all
City.destroy_all
PriceQuestion.destroy_all
LocationQuestion.destroy_all
EveningQuestion.destroy_all
CityTypeQuestion.destroy_all
PriceAnswer.destroy_all
LocationAnswer.destroy_all
EveningAnswer.destroy_all
CityTypeAnswer.destroy_all


puts "Seeding"

price_questions_attributes =
{
  content: 'How much do you want to spend whilst there?'
  }
price = PriceQuestion.create!(price_questions_attributes)

location_questions_attributes =
{content: 'Do you want to travel in Europe or go further?'
  }

location = LocationQuestion.create!(location_questions_attributes)

evening_questions_attributes =
{
  content: 'What would be your perfect evening on a holiday?'
  }

evening = EveningQuestion.create!(evening_questions_attributes)

city_type_attributes =
{
  content: 'What kind of holiday do you want?'
  }
city_type = CityTypeQuestion.create!(city_type_attributes)


PriceAnswer.create!(price_question: price, title: "\u{1F4B0}", payload: "£")
PriceAnswer.create!(price_question: price, title: "\u{1F4B0 1F4B0}", payload: "££")
PriceAnswer.create!(price_question: price, title: "\u{1F4B0 1F4B0 1F4B0}", payload: "£££")

LocationAnswer.create!(location_question: location, title: "Europe \u{1F1EA 1F1FA}", payload: "europe")
LocationAnswer.create!(location_question: location, title: "Further \u{1F30F}", payload: "further")

EveningAnswer.create!(evening_question: evening, title: "Restaurant \u{1F35D}", payload: "restaurant")
EveningAnswer.create!(evening_question: evening, title: "Drinking in a bar \u{1F378}", payload: "bar")
EveningAnswer.create!(evening_question: evening, title: "Meeting Locals \u{1F483}", payload: "locals")

CityTypeAnswer.create!(city_type_question: city_type, title: "Cultural \u{1F3DB FE0F}", payload: "culture")
CityTypeAnswer.create!(city_type_question: city_type, title: "Adventurous \u{1F9D7}", payload: "adventure")
CityTypeAnswer.create!(city_type_question: city_type, title: "Relaxing \u{1F3D6}", payload: "relax")


puts "Now for the cities"


cities_attributes_1 = [
  {
    name: 'Venice, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427422/voyagr/Venice.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Seville, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:   'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427346/voyagr/Seville.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Santorini, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:   'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427331/voyagr/Santorini.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
    {
    name: 'Gdansk, Poland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426892/voyagr/Gdansk.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
     {
    name: 'Canary Islands, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426780/voyagr/Canary_Islands.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },   {
    name: 'Dublin, Ireland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426869/voyagr/Dublin.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },   {
    name: 'Budapest, Hungary',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426756/voyagr/Budapest.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },   {
    name: 'Berlin, Germany',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426671/voyagr/Berlin.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Prague, Czech Republic',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427263/voyagr/Prague.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Dubrovnik, Croatia',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426874/voyagr/Dubrovnik.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Krakow, Poland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427018/voyagr/Krakow.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
    {
    name: 'Madeira, Portugal',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427105/voyagr/Madiera.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
 },
  {
    name: 'Stari Grad, Croatia',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427376/voyagr/Stari_Grad.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Malta Island, Malta',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427113/voyagr/Malta_Island.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Glasgow, UK',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426900/voyagr/Glasgow.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Sarajevo, Bosnia and Herzegovina',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427335/voyagr/Sarajevo.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Prague, Czech Republic',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427263/voyagr/Prague.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Bruges, Belgium',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426737/voyagr/Bruges.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Brighton, UK',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426721/voyagr/Brighton.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  }
]
cities_attributes_2 = [
 {
    name: 'Vienna, Austria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427430/voyagr/Vienna.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
 {
    name: 'Madeira, Portugal',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427105/voyagr/Madiera.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Canary Islands, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426780/voyagr/Canary_Islands.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Kotor, Montenegro',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427011/voyagr/Kotor.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
     {
    name: 'Sofia, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520436347/voyagr/Sofia.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
     {
    name: 'Minsk, Belarus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427144/voyagr/Minsk.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
     {
    name: 'Madrid, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427109/voyagr/Madrid.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Sozopol, Bulgaria',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427363/voyagr/Sozopol.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Granada, Spain',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426919/voyagr/Grenada.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Paphos, Cyprus',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427242/voyagr/Paphos.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
     {
    name: ' Cartagena, Colombia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426804/voyagr/Cartagena.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'Bangkok, Thailand',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426655/voyagr/Bangkok.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: ' Antigua Guatemala, Guatemala',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426641/voyagr/Antigua.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
 {
    name: 'Cusco, Peru',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426861/voyagr/Cusco.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Valparaiso, Chile',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427409/voyagr/Valparaiso.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Kuala Lumpa, Malaysia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427033/voyagr/Kuala-Lumpur.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Boracay, Philippines',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520433047/voyagr/Boracay.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
     }
]
cities_attributes_3 = [
   {
    name: 'Recife, Brazil',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427275/voyagr/Recife.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Bogota, Columbia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426700/voyagr/Bogota.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
    {
    name: 'Delhi, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426863/voyagr/Delhi.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Oaxaca, Mexico',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427222/voyagr/Oaxaca.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Addis Ababa, Ethiopia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426633/voyagr/Addis_Ababa.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Mumbai, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427188/voyagr/Mumbai.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Angkor Wat, Cambodia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426638/voyagr/Angkor_Wat.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Casablanca, Morocco',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426811/voyagr/Casablanca.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
 {
    name: 'Tunis, Tunisia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427404/voyagr/Tunis.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
 {
    name: 'Cancun, Mexico',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426783/voyagr/Cancun.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
 {
    name: 'Jaipur, India',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426993/voyagr/Jaipur.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Lahore, Pakistan',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427060/voyagr/Lahore.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Caracas, Venezuela',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426796/voyagr/Caracas.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Tehran, Iran',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427398/voyagr/Tehran.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Angkor Wat, Cambodia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426638/voyagr/Angkor_Wat.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Colombo, Sri Lanka',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426829/voyagr/Colombo.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Hội An, Vietnam',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426949/voyagr/Hoi_An.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Montevideo, Uruguay',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427166/voyagr/Montevideo.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Vientiane, Laos',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427435/voyagr/Vientiane.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Dublin, Ireland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426869/voyagr/Dublin.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  }
]
  cities_attributes_4 = [

    {
    name: 'Ibiza, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426968/voyagr/Ibiza.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'Bonifacio, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426704/voyagr/Bonifacio.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'Vienna, Austria',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427430/voyagr/Vienna.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
      {
    name: 'Cambridge, England',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426775/voyagr/Cambridge.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
      {
    name: 'Barcelona, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426659/voyagr/Barcelona.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Bilbao, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426677/voyagr/Bilbao.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Lyon, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427094/voyagr/Lyon.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Bratislava, Slovakia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426709/voyagr/Bratislava.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
    {
    name: 'Lisbon, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427072/voyagr/Lisbon.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Mont Saint Michel, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427151/voyagr/Mont_Saint_Michel.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Krk, Croatia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427024/voyagr/Krk.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'Athens, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426643/voyagr/Athens.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Milan, Italy',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427140/voyagr/Milan.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Bucharest, Romania',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426750/voyagr/Bucharest.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Lyon, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427094/voyagr/Lyon.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
     {
    name: 'Santorini, Greece',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427331/voyagr/Santorini.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Porto, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427258/voyagr/Porto.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'La Grave, France',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427045/voyagr/La_Grave.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'Isle of Skye, UK',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426976/voyagr/Isle_of_Skye.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Lisbon, Portugal',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427072/voyagr/Lisbon.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  }
]
cities_attributes_5 = [

   {
    name: 'Munich, Germany',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427200/voyagr/Munich.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Burgos, Spain',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426769/voyagr/Burgos.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Cork, Ireland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426845/voyagr/Cork.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
     {
    name: 'Split, Croatia',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427367/voyagr/Split.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
     {
    name: 'Helsinki, Finland',
    budget:         'Medium',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426951/voyagr/Helsinki.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Rio De Janeiro, Brazil',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427292/voyagr/Rio.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
     {
    name: 'Chicago, Illinois',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426820/voyagr/Chicago.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
     {
    name: 'Moorea, Tahiti',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427182/voyagr/Moorea.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
     {
    name: 'Nairobi, Kenya',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427205/voyagr/Nairobi.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'St. Petersburg, Russia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427371/voyagr/St._Petersburg.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Montreal, Canada',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427173/voyagr/Montreal.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
       {
    name: 'Montego Bay, Jamaica',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427160/voyagr/Montego_Bay.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Suva, Fiji',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427388/voyagr/Suva.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Beirut, Lebanon',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426666/voyagr/Beirut.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: ' Burlington, US',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426627/voyagr/Burlington.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Jakarta, Indonesia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426998/voyagr/Jakarta.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: ' Istanbul, Turkey',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426990/voyagr/Istanbul.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Buenos Aires, Argentina',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426764/voyagr/Buenos_Aires.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Beijing, China',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426663/voyagr/Beijing.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Marrakech, Morocco',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427122/voyagr/Marrakech.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  }
]
cities_attributes_6 = [
    {
    name: 'Hamilton, Burmuda',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426933/voyagr/Hamilton.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
    {
    name: 'Papeete, Bora Bora',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427235/voyagr/Papeete.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
      {
    name: 'Kathmandu, Nepal',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427003/voyagr/Kathmandu.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Zanzibar, Tanzania',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427474/voyagr/Zanzibar.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Samarkand, Uzbekistan',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427317/voyagr/Samarkand.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Petra, Jordan',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427252/voyagr/Petra.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Lalibela, Ethiopia',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427059/voyagr/Lalibela.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Beijing, China',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426663/voyagr/Beijing.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Cape Town, South Africa',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426787/voyagr/Cape_Town.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },   {
    name: 'Honolulu, Hawaii',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426961/voyagr/Honolulu.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Papeete, Bora Bora',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427235/voyagr/Papeete.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
 {
    name: 'Chamonix, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426820/voyagr/Chamonix.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Lucerne, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427091/voyagr/Lucerne.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Capri, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426792/voyagr/Capri.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
 {
    name: 'London, England',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427081/voyagr/London.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Florence, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426884/voyagr/Florence.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Paris, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427247/voyagr/Paris.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Geneva, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426896/voyagr/Geneva.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Manchester, UK',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427117/voyagr/Manchester.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Nice, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427216/voyagr/Nice.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  }
]
cities_attributes_7 = [
   {
    name: 'Mont Saint Michel, France',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427151/voyagr/Mont_Saint_Michel.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Lausanne, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427066/voyagr/Lausanne.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Bergen, Norway',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426669/voyagr/Bergen.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
    {
    name: 'Vatican City',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427416/voyagr/Vatican_City.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Amsterdam, Netherlands',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426635/voyagr/Amsterdam.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
    {
    name: 'Rome, Italy',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427308/voyagr/Rome.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Copenhagen, Denmark',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426835/voyagr/Copenhagen.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Zurich, Switzerland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427480/voyagr/Zurich.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Wild Taiga, Finland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427462/voyagr/Wild_Taiga.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Edinburgh, Scotland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426880/voyagr/Edinburgh.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Gothenburg, Sweden',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426905/voyagr/Gothenburg.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Stockholm, Sweden',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427381/voyagr/Stockholm.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Brussels, Belgium',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426746/voyagr/Brussels.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Maastricht, The Netherlands',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427100/voyagr/Maastricht.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Rotterdam, Netherlands ',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427313/voyagr/Rotterdam.png",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Oslo, Norway',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427230/voyagr/Oslo.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Reykjavik, Iceland',
    budget:         'Expensive',
    location:      'Europe',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427281/voyagr/Reykjavik.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Havana, Cuba',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426939/voyagr/Havana.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
  },
  {
    name: 'Queenstown, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427269/voyagr/Queenstown.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Melbourne, Australia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427133/voyagr/Melbourne.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  }
]
cities_attributes_8 = [
   {
    name: 'Bangkok, Thailand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426655/voyagr/Bangkok.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
  },
   {
    name: 'Osaka, Japan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427227/voyagr/Osaka.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Shanghai, China',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427350/voyagr/Shanghai.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Sydney, Australia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427391/voyagr/Sydney.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Vancouver, Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427413/voyagr/Vancouver.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'San Diego, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427324/voyagr/San_Diego.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'San Francisco, United States',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427328/voyagr/San_Francisco.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Bali, Indonesia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426647/voyagr/Bali.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Niagara Falls, US/ Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427212/voyagr/Niagara_Falls.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Taipei, Taiwan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427395/voyagr/Taipei.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Ulan Bator, Mongolia',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427406/voyagr/Ulan_Bator.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Seoul, South Korea',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427339/voyagr/Seoul.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
  {
    name: 'Washington DC, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427443/voyagr/Washington_DC.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Dubai, United Arab Emirates',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426630/voyagr/Dubai.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Bern, Switzerland',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426673/voyagr/Bern.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
  {
    name: 'Auckland, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426645/voyagr/Auckland.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Grand Canyon, US',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426913/voyagr/Grand_Canyon.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
  {
    name: 'Banff, Canada',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426653/voyagr/Banff.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure')
  },
   {
    name: 'Kyoto, Japan',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427039/voyagr/Kyoto.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Wellington, New Zealand',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427452/voyagr/Wellington.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  }
]
cities_attributes_9 = [
   {
    name: 'Hong Kong',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426955/voyagr/Hong_Kong.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture')
  },
   {
    name: 'Victoria, Seychelles',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427426/voyagr/Vicroria.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Honolulu, Hawaii',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426961/voyagr/Honolulu.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  },
   {
    name: 'Dubai, UAE',
    budget:         'Expensive',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426630/voyagr/Dubai.jpg",
    price_answer: PriceAnswer.find_by(payload: '£££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax')
  }
]

City.create!(cities_attributes_1)
cities_attributes_1.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
# cities_attributes_2.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_3.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_4.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_5.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_6.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_7.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_8.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end
# cities_attributes_9.each do |attr|
#   c = City.create!(attr)
#   puts c.name + " created"
#   sleep(1)
# end

cities = City.all
cities.each do |city|

#   params_hotel = {
#       key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
#       location: "#{city.latitude},#{city.longitude}",
#       radius: 50000,
#       keyword: "hotel"
#     }

#   response_hotel =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_hotel})
#   hotels = JSON.parse(response_hotel)
#   hotel = hotels["results"][0]
#   photos = hotel["photos"] if hotel
#   photo = photos[0] if photos
#   ref_pic = photo["photo_reference"] if photo
#   ref_pic ||= ''
#   hotel_name = hotel["name"] if hotel
#   hotel_description = hotel["vicinity"] if hotel

#   hotel = Suggestion.new(city: city, name: hotel_name, description: hotel_description, photo:ref_pic, result_type: "hotel")
#   hotel.save!
#   sleep(1)

#   params_restaurant = {
#       key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
#       location: "#{city.latitude},#{city.longitude}",
#       radius: 50000,
#       keyword: "restaurant" || "cafe"
#     }

#   response_restaurant =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_restaurant})
#   restaurants = JSON.parse(response_restaurant)
#   restaurant = restaurants["results"][0]
#   photos = restaurant["photos"] if restaurant
#   photo = photos[0] if photos
#   ref_pic = photo["photo_reference"] if photo
#   ref_pic ||= ''
#   restaurant_name = restaurant["name"] if restaurant
#   restaurant_description = restaurant["vicinity"] if restaurant

#   restaurant = Suggestion.new(city: city, name: restaurant_name, description: restaurant_description, photo:ref_pic, result_type: "restaurant")
#   restaurant.save!
#   sleep(1)


  puts 'Now for the entertainment'


  #keyword_sample = ["museum", "city_hall", "hindu_temple", "church", "mosque", "synagogue", "night_club", "amusement_park", "aquarium", "art_gallery", "movie_theater", "spa", "casino"].sample


  params_entertainment = {
         key: "AIzaSyAGYBhluHCFSVj320yVTgBqkcw93HUgfL0",
         location: "#{city.latitude},#{city.longitude}",
         radius: 50000,
         keyword: "museum" || "city_hall" || "hindu_temple" || "church" || "mosque" || "synagogue" || "night_club" || "amusement_park" || "aquarium" || "art_gallery" || "movie_theater" || "spa" || "casino"
  }

  response_entertainment =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_entertainment})
  entertainments = JSON.parse(response_entertainment)

  entertainment = entertainments["results"][0]
  entertainment_1 = entertainments["results"][1]


  photos = entertainment["photos"] if entertainment

  photo = photos[0] if photos
  ref_pic = photo["photo_reference"] if photo
  ref_pic ||= ''
  entertainment_name = entertainment["name"] if entertainment
  entertainment_1_name = entertainment_1["name"] if entertainment_1

  entertainment_description = entertainment["vicinity"] if entertainment
  entertainment_1_description = entertainment_1["vicinity"] if entertainment_1

  entertainment = Suggestion.new(city: city, name: entertainment_name, description: entertainment_description, photo:ref_pic, result_type: "entertainment")
  entertainment_1 = Suggestion.new(city: city, name: entertainment_1_name, description: entertainment_1_description, photo:ref_pic, result_type: "entertainment")

  entertainment.save!
  entertainment_1.save!
  sleep(1)

  puts 'Now for the photos'

  params_photos = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{city.latitude},#{city.longitude}",
      radius: 50000,
  }

  response_photos =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_photos})
  photos = JSON.parse(response_photos)
  photo = photos["results"][0]
  photos = photo["photos"] if photo
  photo = photos[0] if photos
  ref_pic = photo["photo_reference"] if photo
  ref_pic ||= ''

  photo = CityPhoto.new(city: city, photo:ref_pic)
  photo.save!
  sleep(1)
end



#entertainments.each do |entertainment|
#   entertainment["results"]
#   photos = entertainment["photos"] if entertainment
#   photo = photos if photos
#   ref_pic = photo["photo_reference"] if photo
#   ref_pic ||= ''
#   entertainment_name = entertainment["name"] if entertainment
#   entertainment_description = entertainment["vicinity"] if entertainment

#   entertainment = Suggestion.new(city: city, name: entertainment_name, description: entertainment_description, photo:ref_pic, result_type: "entertainment")
#   entertainment.save!
# end
