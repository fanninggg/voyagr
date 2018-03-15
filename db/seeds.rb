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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Basilica di San Marco',
    top_attractions_2: "Gellerie dell'Accademia",
    top_attractions_3: 'Cruising Canals'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Real Alcázar',
    top_attractions_2: 'Catedral & Giralda',
    top_attractions_3: 'Dance Flamenco'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Ancient Akrotiri',
    top_attractions_2: 'Ammoudi Port',
    top_attractions_3: 'Wine Tasting'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Długi Targ',
    top_attractions_2: 'European Solidarity Center',
    top_attractions_3: 'Sopot Bar'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Santuario de la Virgen de las Nieves',
    top_attractions_2: 'Cueva Pintada Museum & Archaeological Park',
    top_attractions_3: 'Cueva de los Verdes'
  },
  {
    name: 'Dublin, Ireland',
    budget:         'low',
    location:      'Europe',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426869/voyagr/Dublin.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'europe'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'A Dublin Pub!',
    top_attractions_2: 'Trinity College',
    top_attractions_3: 'National Museum Of Ireland'
  },
  {
     name: 'Budapest, Hungary',
     budget:         'low',
     location:      'Europe',
     type_of_evening:  'Bar',
     type_of_city:        'Culturous',
     photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426756/voyagr/Budapest.jpg",
     price_answer: PriceAnswer.find_by(payload: '£'),
     location_answer: LocationAnswer.find_by(payload: 'europe'),
     evening_answer: EveningAnswer.find_by(payload: 'bar'),
     city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
     top_attractions_1: 'Thermal Baths & Spas',
     top_attractions_2: 'Royal Palace, Castle District',
     top_attractions_3: 'Ruin Pubs & Garden Clubs',
   },
  {
     name: 'Berlin, Germany',
     budget:         'low',
     location:      'Europe',
     type_of_evening:  'Bar',
     type_of_city:        'Culturous',
     photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426671/voyagr/Berlin.jpg",
     price_answer: PriceAnswer.find_by(payload: '£'),
     location_answer: LocationAnswer.find_by(payload: 'europe'),
     evening_answer: EveningAnswer.find_by(payload: 'bar'),
     city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
     top_attractions_1: 'Brandenburg Gate, Historic Mitte',
     top_attractions_2: 'Reichstag, Historic Mitte',
     top_attractions_3: 'Berlin Wall, Prenzlauer Berg'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
     top_attractions_1: 'Charles Bridge',
     top_attractions_2: 'Prague Castle',
     top_attractions_3: 'Prague, Queen Of Music'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
     top_attractions_1: 'City Walls & Forts',
     top_attractions_2: 'Lokrum',
     top_attractions_3: 'Cable Car'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
     top_attractions_1: 'Wawel Castle',
     top_attractions_2: 'Rynek Underground',
     top_attractions_3: 'Schindler’s Factory'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
     top_attractions_1: 'Quinta das Cruzes',
     top_attractions_2: 'Museu de Arte Sacra',
     top_attractions_3: 'Dolphin & Whale Watching'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
     top_attractions_1: 'Stari Grad Plain',
     top_attractions_2: 'Tvrdalj Castle',
     top_attractions_3: 'The Church of St Stephen'
   },
   {
     name: 'Malta',
     budget:         'low',
     location:      'Europe',
     type_of_evening:  'Restaurant',
     type_of_city:        'Adventurous',
     photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427113/voyagr/Malta_Island.jpg",
     price_answer: PriceAnswer.find_by(payload: '£'),
     location_answer: LocationAnswer.find_by(payload: 'europe'),
     evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
     city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
     top_attractions_1: 'Valletta',
     top_attractions_2: "Vittoriosa\'s Backstreets",
     top_attractions_3: 'Blue Lagoon, Comino'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
     top_attractions_1: 'Kelvingrove Art Gallery & Museum',
     top_attractions_2: 'Glasgow School Of Art',
     top_attractions_3: 'Ubiquitous Chip'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
     top_attractions_1: 'Baščaršija',
     top_attractions_2: 'Zlatna Ribica',
     top_attractions_3: 'Tunnel Museum'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
     top_attractions_1: 'Charles Bridge, Malá Strana',
     top_attractions_2: 'Prague Castle',
     top_attractions_3: 'Prague, Queen Of Music'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
     top_attractions_1: 'Belfort',
     top_attractions_2: 'Groening Museum',
     top_attractions_3: 'Drink Beer & Eat Chocolate'
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
     city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
     top_attractions_1: 'Royal Pavilion',
     top_attractions_2: 'i360 Tower',
     top_attractions_3: 'Brighton Palace Pier'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Spanish Riding School',
    top_attractions_2: 'Schloss Belvedere',
    top_attractions_3: 'Kunsthistorisches Museum Vienna'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Quinta das Cruzes',
    top_attractions_2: 'Museu de Arte Sacra',
    top_attractions_3: 'Dolphin & Whale Watching'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Santuario de la Virgen de las Nieves',
    top_attractions_2: 'Cueva Pintada Museum & Archaeological Park',
    top_attractions_3: 'Cueva de los Verdes'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'St Tryphon’s Cathedral',
    top_attractions_2: 'Sea Gate',
    top_attractions_3: 'Town Walls'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Aleksander Nevski Cathedral',
    top_attractions_2: 'Ancient Serdica Complex',
    top_attractions_3: 'Archaeological Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Museum of the Great Patriotic War',
    top_attractions_2: 'Pr Nezalezhnastsi',
    top_attractions_3: 'Stalin Line Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Museo Del Prado',
    top_attractions_2: 'Plaza Mayor',
    top_attractions_3: 'Centro De Arte Reina Sofía'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Archaeological Museum',
    top_attractions_2: 'Church of Sveta Bogoroditsa',
    top_attractions_3: 'Southern Fortress Wall & Tower Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Alhambra',
    top_attractions_2: 'Capilla Real',
    top_attractions_3: 'Basílica San Juan de Díos'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Horse Riding Paphos - Eagle Mountain',
    top_attractions_2: 'Vouni Panayia Winery',
    top_attractions_3: 'Aphrodite\'s Rock Brewing Company'
  },
  {
    name: 'Cartagena, Colombia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426804/voyagr/Cartagena.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Castillo de San Felipe de Barajas',
    top_attractions_2: 'Palacio de la Inquisición',
    top_attractions_3: 'Old Town'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Jim Thompson House',
    top_attractions_2: 'Wat Pho',
    top_attractions_3: 'Chatuchak Weekend Market'
  },
  {
    name: 'Antigua Guatemala, Guatemala',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426641/voyagr/Antigua.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Iglesia y Convento de Santo Domingo',
    top_attractions_2: 'Catedral de Santiago',
    top_attractions_3: 'Bars: Café No Sé'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Qurikancha',
    top_attractions_2: 'Museo Inka',
    top_attractions_3: 'Machu Picchu'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'La Sebastiana',
    top_attractions_2: 'Parque Cultural de Valparaíso',
    top_attractions_3: 'Plaza Sotomayor'
  },
  {
    name: 'Kuala Lumpur, Malaysia',
    budget:         'low',
    location:      'Worldwide',
    type_of_evening:  'Bar',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520427033/voyagr/Kuala-Lumpur.jpg",
    price_answer: PriceAnswer.find_by(payload: '£'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'bar'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Kampung Baru',
    top_attractions_2: 'Sin Sze Si Ya Temple',
    top_attractions_3: 'Islamic Arts Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Yapak Beach (Puka Shell Beach)',
    top_attractions_2: 'Mt Luho View Deck',
    top_attractions_3: 'The Ruf Resto Bar'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Oficina Cerâmica Francisco Brennand',
    top_attractions_2: 'Paço do Frevo',
    top_attractions_3: 'Museu Cais do Sertão'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museo Del Oro',
    top_attractions_2: 'Plaza de Bolívar',
    top_attractions_3: 'Museo Botero'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Humayun’s Tomb',
    top_attractions_2: 'Red Fort',
    top_attractions_3: 'Jama Masjid'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Museo de las Culturas de Oaxaca',
    top_attractions_2: 'Templo de Santo Domingo',
    top_attractions_3: 'Lapiztola'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Ethnological Museum',
    top_attractions_2: 'National Museum',
    top_attractions_3: '\'Red Terror\' Martyrs Memorial Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Taj Mahal Palace',
    top_attractions_2: 'Chhatrapati Shivaji Terminus',
    top_attractions_3: 'Iskcon Temple'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'The Army of Suryavarman II',
    top_attractions_2: 'Churning of the Ocean of Milk',
    top_attractions_3: 'The Battle of Kurukshetra'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Hassan II Mosque',
    top_attractions_2: 'Moroccan Jewish Museum',
    top_attractions_3: 'Abderrahman Slaoui Foundation Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Medina',
    top_attractions_2: 'Bardo Museum',
    top_attractions_3: 'Carthage'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museo Maya de Cancún',
    top_attractions_2: 'Parque Nacional Isla Contoy',
    top_attractions_3: 'Cabañas Playa Blanca'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'City Palace',
    top_attractions_2: 'Hawa Mahal',
    top_attractions_3: 'Jantar Mantar'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Lahore Fort',
    top_attractions_2: 'Badshahi Mosque',
    top_attractions_3: 'Jehangir\'s Tomb'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Iglesia de San Francisco',
    top_attractions_2: 'Museo de Arte Contemporáneo de Caracas',
    top_attractions_3: 'Fundación Bigott'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Golestan Palace',
    top_attractions_2: 'Grand Bazaar',
    top_attractions_3: 'Treasury Of National Jewels'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'The Army of Suryavarman II',
    top_attractions_2: 'Churning of the Ocean of Milk',
    top_attractions_3: 'The Battle of Kurukshetra'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Galle Face Green',
    top_attractions_2: 'National Museum',
    top_attractions_3: 'Ministry Of Crab'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Vietnamese Women\'s Museum',
    top_attractions_2: 'Hanoi Kiem Lake',
    top_attractions_3: 'Temple of Literature'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museo Nacional de Artes Visuales',
    top_attractions_2: 'Teatro Solís',
    top_attractions_3: 'Museo del Gaucho'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Pha That Luang',
    top_attractions_2: 'Cope Visitor Centre',
    top_attractions_3: 'Wat Si Saket'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'A Dublin Pub!',
    top_attractions_2: 'Trinity College',
    top_attractions_3: 'National Museum Of Ireland'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Dalt Vila',
    top_attractions_2: 'Platja de Ses Salines',
    top_attractions_3: 'Platges de Comte'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Grottes de Bonifacio',
    top_attractions_2: 'Bonifacio Citadel',
    top_attractions_3: 'Plage du Petit Sperone'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Schloss Belvedere',
    top_attractions_2: 'Spanish Riding School, The Hofburg',
    top_attractions_3: 'Kunsthistorisches Museum Vienna'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'King\'s College Chapel',
    top_attractions_2: 'Trinity College',
    top_attractions_3: 'Fitzwilliam Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'La Sagrada Família',
    top_attractions_2: 'Modernista Architecture',
    top_attractions_3: 'Museu Picasso'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museo Guggenheim Bilbao',
    top_attractions_2: 'Casco Viejo',
    top_attractions_3: 'Museo De Bellas Artes'

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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Basilique Notre Dame de Fourvière',
    top_attractions_2: 'Musée des Beaux-Arts',
    top_attractions_3: 'Lyon Confluence'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Apponyi Palace',
    top_attractions_2: 'Hlavné Námestie',
    top_attractions_3: 'Blue Church'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
        top_attractions_1: 'Mosteiro dos Jerónimos',
    top_attractions_2: 'Castelo de São Jorge',
    top_attractions_3: 'Museu Nacional de Arte Antiga'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Abbaye du Mont-Saint-Michel',
    top_attractions_2: 'Baie du Mont St Michel',
    top_attractions_3: 'Tour du Nord'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Zip Line',
    top_attractions_2: 'Kayaking & Canoeing',
    top_attractions_3: 'Rent a Boat'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Parthenon',
    top_attractions_2: 'Acropolis Museum',
    top_attractions_3: 'Benaki Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'The Last Supper',
    top_attractions_2: 'Duomo',
    top_attractions_3: 'Cimitero Monumentale'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Palace of Parliament',
    top_attractions_2: 'Former Ceauşescu Residence',
    top_attractions_3: 'Romanian Athenaeum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Basilique Notre Dame de Fourvière',
    top_attractions_2: 'Musée des Beaux-Arts',
    top_attractions_3: 'Lyon Confluence'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Ancient Akrotiri',
    top_attractions_2: 'Ammoudi Port',
    top_attractions_3: 'Wine Tasting'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Wine Tour',
    top_attractions_2: 'Santiago de Compostela',
    top_attractions_3: 'Guimarães and Braga'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Telepherique des Glaciers de la Meije',
    top_attractions_2: 'Snowlegend',
    top_attractions_3: 'Rafting'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Neist Point',
    top_attractions_2: 'Claigan Coral Beach',
    top_attractions_3: 'Dinosaur Footprints'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Mosteiro dos Jerónimos',
    top_attractions_2: 'Castelo de São Jorge',
    top_attractions_3: 'Museu Nacional de Arte Antiga'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Residenzmuseum',
    top_attractions_2: 'Schloss Nymphenburg',
    top_attractions_3: 'Münchner Stadtmuseum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Catedral',
    top_attractions_2: 'Museo de la Evolución Human',
    top_attractions_3: 'Monasterio de las Huelgas'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Cork City Gaol',
    top_attractions_2: 'English Market',
    top_attractions_3: 'St Fin Barre\'s Cathedral'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Cathedral of St Domnius',
    top_attractions_2: 'Diocletian\'s Palace',
    top_attractions_3: 'Klis Fortress'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Suomenlinna',
    top_attractions_2: 'Ateneum',
    top_attractions_3: 'Seurasaaren Ulkomuseo'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Parque Nacional da Tijuca',
    top_attractions_2: 'Pão de Açúcar',
    top_attractions_3: 'Copacabana Beach'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Field Museum of Natural History',
    top_attractions_2: 'Art Institute of Chicago',
    top_attractions_3: 'Wrigley Field'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Cook\'s Bay',
    top_attractions_2: 'Opunohu Bay',
    top_attractions_3: 'Hauru Point'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'David Sheldrick Wildlife Trust',
    top_attractions_2: 'Nairobi National Park',
    top_attractions_3: 'National Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'State Hermitage Museum',
    top_attractions_2: 'Grand Palace',
    top_attractions_3: 'General Staff Building'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Rue St-Denis',
    top_attractions_2: 'Musee des Beaux-Arts de Montreal',
    top_attractions_3: 'Vieux-Port de Montréal'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'National Museum West',
    top_attractions_2: 'Doctor\'s Cave Beach',
    top_attractions_3: 'Indigenous Rastafarian Village'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Fiji Museum',
    top_attractions_2: 'Colo-i-Suva Forest Park',
    top_attractions_3: 'Suva Municipal Market'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'National Museum of Beirut',
    top_attractions_2: 'MIM',
    top_attractions_3: 'St George Crypt Museum'
  },
  {
    name: 'Burlington, US',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Adventurous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426627/voyagr/Burlington.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Shelburne Museum',
    top_attractions_2: 'Intervale Center',
    top_attractions_3: 'Magic Hat Brewery'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Museum Nasional',
    top_attractions_2: 'Merdeka Square',
    top_attractions_3: 'Museum Bank Indonesia'
  },
  {
    name: 'Istanbul, Turkey',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Restaurant',
    type_of_city:        'Culturous',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426990/voyagr/Istanbul.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'restaurant'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Topkapı Palace',
    top_attractions_2: 'Süleymaniye Mosque',
    top_attractions_3: 'Kariye Museum (Chora Church)'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Centro Cultural Kirchner',
    top_attractions_2: 'Casa Rosada',
    top_attractions_3: 'Parque 3 de Febrero'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Forbidden City',
    top_attractions_2: 'Temple of Heaven Park',
    top_attractions_3: 'Summer Palace'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Djemaa El Fna',
    top_attractions_2: 'Ali Ben Youssef Medersa',
    top_attractions_3: 'Musée Yves Saint Laurent'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Bermuda National Gallery',
    top_attractions_2: 'Holy Trinity Cathedral',
    top_attractions_3: 'Sessions House'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Marché de Pape’ete',
    top_attractions_2: 'Robert Wan Musée de la Perle',
    top_attractions_3: 'Musée de la Perle'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Hanuman Dhoka',
    top_attractions_2: 'Itum Bahal',
    top_attractions_3: 'Garden of Dreams'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'House of Wonders',
    top_attractions_2: 'Forodhani Gardens',
    top_attractions_3: 'Old Dispensary'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Registan',
    top_attractions_2: 'Gur-e-Amir Mausoleum',
    top_attractions_3: 'Shah-i-Zinda'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Monastry',
    top_attractions_2: 'Siq, The Ancient City',
    top_attractions_3: 'High Place of Sacrifice'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Bet Giyorgis',
    top_attractions_2: 'Yemrehanna Kristos',
    top_attractions_3: 'Bet Maryam'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Forbidden City',
    top_attractions_2:  'Temple of Heaven Park',
    top_attractions_3: 'Summer Palace'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Kirstenbosch National Botanical Garden',
    top_attractions_2: 'Cape of Good Hope',
    top_attractions_3: 'Table Mountain '
  },
  {
    name: 'Honolulu, Hawaii',
    budget:         'Medium',
    location:      'Worldwide',
    type_of_evening:  'Meet the locals',
    type_of_city:        'Relaxing',
    photo: "http://res.cloudinary.com/dm2e6swvo/image/upload/v1520426961/voyagr/Honolulu.jpg",
    price_answer: PriceAnswer.find_by(payload: '££'),
    location_answer: LocationAnswer.find_by(payload: 'further'),
    evening_answer: EveningAnswer.find_by(payload: 'locals'),
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Bishop Museum',
    top_attractions_2:  '\'Iolani Palace',
    top_attractions_3: 'Honolulu Museum of Art'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Marché de Pape’ete',
    top_attractions_2: 'Robert Wan Musée de la Perle',
    top_attractions_3:  'Musée de la Perle'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Aiguille du Midi',
    top_attractions_2: 'Musée des Cristaux',
    top_attractions_3: 'Mer de Glace'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Sammlung Rosengart',
    top_attractions_2: 'Kapellbrücke',
    top_attractions_3: 'Lion Monument'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Villa Jovis',
    top_attractions_2: 'Certosa di San Giacomo',
    top_attractions_3:  'Giardini di Augusto'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Westminster Abbey',
    top_attractions_2: 'St Paul\'s Cathedral',
    top_attractions_3: 'Natural History Museum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Galleria degli Uffizi',
    top_attractions_2:  'Basilica di Santa Maria Novella',
    top_attractions_3: 'Palazzo Vecchio'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Musée du Louvre',
    top_attractions_2: 'Cathédrale Notre Dame de Paris',
    top_attractions_3: 'Jardin du Luxembourg'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'CERN',
    top_attractions_2: 'Conservatoire et Jardin Botaniques',
    top_attractions_3:  "Musée d\'Ethnographie de Genève"
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museum of Science & Industry',
    top_attractions_2: 'People\'s History Museum',
    top_attractions_3: 'Manchester Art Gallery'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Vieux Nice',
    top_attractions_2: 'Promenade des Anglais',
    top_attractions_3:  'Parc du Château'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Normandy Mont-Saint-Michel Abbey',
    top_attractions_2: 'Normandy Mont-Saint-Michel Abbey',
    top_attractions_3: 'Private Walking Tour of Mont Saint Michel'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Musée Cantonal des Beaux Arts',
    top_attractions_2: 'Olympic Museum',
    top_attractions_3: 'Cathédrale de Notre Dame'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Bryggen',
    top_attractions_2:  'Edvard Grieg Museum',
    top_attractions_3: 'Kode'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Vatican Museums',
    top_attractions_2: 'St Peter\'s Basilica',
    top_attractions_3: 'Castel Sant\'Angelo'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Rijksmuseum',
    top_attractions_2: 'Anne Frank Huis',
    top_attractions_3: 'Museum het Rembrandthuis'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Vatican Museums',
    top_attractions_2:  'Roman Forum',
    top_attractions_3: 'Colosseum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Tivoli Gardens',
    top_attractions_2:  'Christiania',
    top_attractions_3:  'Rosenborg Slot'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Kunsthaus',
    top_attractions_2:  'Fraumünster',
    top_attractions_3: 'Schweizerisches Landesmuseum'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Fishing and Bear Watching',
    top_attractions_2:  'Aurora Boreals',
    top_attractions_3: 'Night With Wolverines'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Edinburgh Castle',
    top_attractions_2: 'Scottish Parliament Building',
    top_attractions_3: 'Royal Yacht Britannia'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Konstmuseum',
    top_attractions_2: 'Universeum',
    top_attractions_3: 'Röda Sten Konsthall'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Kungliga Slottet',
    top_attractions_2:  'Vasamuseet',
    top_attractions_3:  'Skansen'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Old England Building',
    top_attractions_2: 'Musée du Cinquantenaire',
    top_attractions_3:  'Église Notre-Dame du Sablon'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Bonnefantenmuseum',
    top_attractions_2:  'Sint Servaasbasiliek',
    top_attractions_3:  'Fort Sint Pieter'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museum Boijmans van Beuningen',
    top_attractions_2: 'Uit Je Eigen Stad',
    top_attractions_3: 'Kralingse Bos and Plas'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Ekebergparken',
    top_attractions_2: 'Astrup Fearnley Museet',
    top_attractions_3:  'Ibsen Museet'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Hallgrímskirkja',
    top_attractions_2: 'Harpa',
    top_attractions_3: 'National Museum'
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
    top_attractions_1: 'Necrópolis Cristóbal Colón',
    top_attractions_2:  'Museo de la Revolución',
    top_attractions_3: 'Fusterlandia'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Lake Wakatipu',
    top_attractions_2: 'Queenstown Gardens',
    top_attractions_3:  'Skyline Gondola'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Royal Botanic Gardens',
    top_attractions_2: 'NGV International',
    top_attractions_3: 'Melbourne Cricket Ground'
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
    top_attractions_1: 'Jim Thompson House',
    top_attractions_2: 'Wat Pho',
    top_attractions_3: 'Chatuchak Weekend Market'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Osaka-jō',
    top_attractions_2: 'Amerika-Mura',
    top_attractions_3: 'Dōtombori'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'M50',
    top_attractions_2:  'Yùyuán Gardens & Bazaar',
    top_attractions_3:  'The Bund'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Bondi Beach',
    top_attractions_2: 'Sydney Harbour Bridge',
    top_attractions_3: 'Sydney Opera House'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Museum of Anthropology',
    top_attractions_2: 'Stanley Park',
    top_attractions_3: 'Science World'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'San Diego Zoo',
    top_attractions_2: 'California Surf Museum',
    top_attractions_3: 'Cave Store'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Golden Gate Park',
    top_attractions_2: 'San Francisco Museum of Modern Art',
    top_attractions_3: '826 Valencia'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Bedugul',
    top_attractions_2: 'Candi Dasa',
    top_attractions_3:  'Semarapura'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Horseshoe Falls',
    top_attractions_2:  'Table Rock',
    top_attractions_3:  'Bridal Veil Falls'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'National Palace Museum',
    top_attractions_2: 'Taipei 101',
    top_attractions_3: 'Dihua Street'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Gorkhi-Terelj National Park',
    top_attractions_2: 'Gandantegchinlen Monastery',
    top_attractions_3:  'Sükhbaatar Square'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Seoullo 7017',
    top_attractions_2: 'Changdeokgung',
    top_attractions_3: 'Deoksugung'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Lincoln Memorial',
    top_attractions_2: 'National Air and Space Museum',
    top_attractions_3:  'Washington National Cathedral'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Burj Al Arab',
    top_attractions_2: 'Dubai Museum',
    top_attractions_3: 'IMG Worlds of Adventure'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Berner Altstadt',
    top_attractions_2: 'Museum für Kommunikation',
    top_attractions_3:  'Zytglogge '
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'One Tree Hill',
    top_attractions_2: 'Auckland Museum',
    top_attractions_3: 'Mt Eden'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Grand Canyon National Park North Rim',
    top_attractions_2: 'Marble Viewpoint',
    top_attractions_3:  'Desert View Watchtower'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'adventure'),
    top_attractions_1: 'Banff National Park',
    top_attractions_2: 'Whyte Museum of the Canadian Rockies',
    top_attractions_3:  'Upper Hot Springs Pool'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Enryaku-ji',
    top_attractions_2: 'Kiyomizu-dera',
    top_attractions_3:  'Fushimi Inari-Taisha'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Zealandia',
    top_attractions_2: 'Wellington Museum',
    top_attractions_3: 'Wellington Botanic Gardens'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'culture'),
    top_attractions_1: 'Man Mo Temple',
    top_attractions_2: 'Victoria Peak',
    top_attractions_3: 'Tsim Sha Tsui East Promenade'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Market',
    top_attractions_2: 'Cathedral of the Immaculate Conception',
    top_attractions_3: 'Botanical Garden'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Bishop Museum',
    top_attractions_2: 'ʻIolani Palace',
    top_attractions_3: 'Honolulu Museum of Art'
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
    city_type_answer: CityTypeAnswer.find_by(payload: 'relax'),
    top_attractions_1: 'Burj Al Arab',
    top_attractions_2: 'Dubai Museum',
    top_attractions_3: 'IMG Worlds of Adventure'
  }
]

cities_attributes_1.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_2.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_3.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_4.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_5.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_6.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_7.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
cities_attributes_8.each do |attr|
  c = City.create!(attr)
  puts c.name + " created"
  sleep(1)
end
 cities_attributes_9.each do |attr|
   c = City.create!(attr)
   puts c.name + " created"
   sleep(1)
 end


cities = City.all
counter = 0
cities.each do |city|

  params_photos = {
      key:  "AIzaSyAzm0FC5Po0aquCv4jtrAtGvu1UPljgDg8",
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


  response_photos =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_photos})
  photos = JSON.parse(response_photos)
  photo_1 = photos["results"][1]
  photos_1 = photo_1["photos"] if photo_1
  photo_1 = photos_1[0] if photos_1
  ref_pic_1 = photo_1["photo_reference"] if photo_1
  ref_pic_1 ||= ''


  photo_1 = CityPhoto.new(city: city, photo:ref_pic_1)
  photo_1.save!


  response_photos =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_photos})
  photos = JSON.parse(response_photos)
  photo_2 = photos["results"][2]
  photos_2 = photo_2["photos"] if photo_2
  photo_2 = photos_2[0] if photos_2
  ref_pic_2 = photo_2["photo_reference"] if photo_2
  ref_pic_2 ||= ''


  photo_2 = CityPhoto.new(city: city, photo:ref_pic_2)
  photo_2.save!


  response_photos =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_photos})
  photos = JSON.parse(response_photos)
  photo_3 = photos["results"][3]
  photos_3 = photo_3["photos"] if photo_3
  photo_3 = photos_3[0] if photos_3
  ref_pic_3 = photo_3["photo_reference"] if photo_3
  ref_pic_3 ||= ''


  photo_3 = CityPhoto.new(city: city, photo:ref_pic_3)
  photo_3.save!

  response_photos =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_photos})
  photos = JSON.parse(response_photos)
  photo_4 = photos["results"][4]
  photos_4 = photo_4["photos"] if photo_4
  photo_4 = photos_4[0] if photos_4
  ref_pic_4 = photo_4["photo_reference"] if photo_4
  ref_pic_4 ||= ''

  photo_4 = CityPhoto.new(city: city, photo:ref_pic_4)
  photo_4.save!

  counter += 1
  puts counter
  sleep(1)
end
