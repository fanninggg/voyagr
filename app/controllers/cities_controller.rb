require 'rest-client'
require 'date'
require 'json'
require 'open-uri'

class CitiesController < ApplicationController
  def index

    if @cities = City.where.not(latitude: nil, longitude: nil)
       @markers = @cities.map do |city|
        {
          lat: city.latitude,
          lng: city.longitude,
        }
      end
    else
      @cities = City.all
    end
    @city = City.all.sample(3)
  end

  def show

    @city = City.find(params[:id])

    @markers = [
      {
        lat: @city.latitude,
        lng: @city.longitude,
        icon: "http://res.cloudinary.com/dm2e6swvo/image/upload/c_scale,w_50/v1520525872/voyagr/black-pin.png"}]


    # params_hotel = {
    #   key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
    #   location: "#{@city.latitude},#{@city.longitude}",
    #   radius: 50000,
    #   keyword: "hotel"
    # }

    # response_hotel =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_hotel})
    # @hotel = JSON.parse(response_hotel)


    # params_restaurant = {
    #   key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
    #   location: "#{@city.latitude},#{@city.longitude}",
    #   radius: 50000,
    #   keyword: "restaurant" || "cafe"
    # }

    # response_restaurant =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_restaurant})
    # @restaurant = JSON.parse(response_restaurant)


    # params_entertainment = {
    #   key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
    #   location: "#{@city.latitude},#{@city.longitude}",
    #   radius: 50000,
    #   keyword: "night_club" || "amusement_park" || "aquarium" || "art_gallery" || "movie_theater" || "spa" || "casino"
    # }

    # response_entertainment =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_entertainment})
    # @entertainment = JSON.parse(response_entertainment)


    # params_sightseeing = {
    #   key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
    #   location: "#{@city.latitude},#{@city.longitude}",
    #   radius: 50000,
    #   keyword: "museum" || "city_hall" || "hindu_temple" || "church" || "mosque" || "synagogue"
    # }
    # &directFlights=1&partner=picky&limit=1

    # response_sightseeing =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_sightseeing})
    # @sightseeing = JSON.parse(response_sightseeing)


def find_flight_next_weekend
  @city = City.find(params[:id])
  latitude = @city.latitude
  longitude = @city.longitude
  radius = "50km"
  @city_from = "LHR,LGW,LCY,STN,SEN"
  @city_to = "#{latitude}-#{longitude}-#{radius}"
  next_friday = Date.today.next_week.advance(:days=>4)
  next_sunday= Date.today.next_week.advance(:days=>6)
  url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_friday.strftime("%d/%m/%Y")}&dateTo=#{next_sunday.strftime("%d/%m/%Y")}&partner=picky&partner_market=eur&curr=GBP&limit=1"
  response_flight = RestClient.get(url)
  flight = JSON.parse(response_flight)
  puts flight_price = flight["data"].first["conversion"]["GBP"]
end

def find_flight_next_next_weekend
  @city = City.find(params[:id])
  latitude = @city.latitude
  longitude = @city.longitude
  radius = "50km"
  @city_from = "LHR,LGW,LCY,STN,SEN"
  @city_to = "#{latitude}-#{longitude}-#{radius}"
  next_next_friday = Date.today.next_week.advance(:days=>11)
  next_next_sunday= Date.today.next_week.advance(:days=>13)
  url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_next_friday.strftime("%d/%m/%Y")}&dateTo=#{next_next_sunday.strftime("%d/%m/%Y")}&partner=picky&partner_market=eur&curr=GBP&limit=1"
  response_flight = RestClient.get(url)
  flight = JSON.parse(response_flight)
  puts flight_price = flight["data"].first["conversion"]["GBP"]
end

def three_weekend
  @city = City.find(params[:id])
  latitude = @city.latitude
  longitude = @city.longitude
  radius = "50km"
  @city_from = "LHR,LGW,LCY,STN,SEN"
  @city_to = "#{latitude}-#{longitude}-#{radius}"
  three_friday = Date.today.next_week.advance(:days=>18)
  three_sunday= Date.today.next_week.advance(:days=>20)
  url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{three_friday.strftime("%d/%m/%Y")}&dateTo=#{three_sunday.strftime("%d/%m/%Y")}&partner=picky&partner_market=eur&curr=GBP&limit=1"
  response_flight = RestClient.get(url)
  flight = JSON.parse(response_flight)
  puts flight_price = flight["data"].first["conversion"]["GBP"]
end

def four_weekend
  @city = City.find(params[:id])
  latitude = @city.latitude
  longitude = @city.longitude
  radius = "50km"
  @city_from = "LHR,LGW,LCY,STN,SEN"
  @city_to = "#{latitude}-#{longitude}-#{radius}"
  four_friday = Date.today.next_week.advance(:days=>25)
  four_sunday= Date.today.next_week.advance(:days=>27)
  url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{four_friday.strftime("%d/%m/%Y")}&dateTo=#{four_sunday.strftime("%d/%m/%Y")}&partner=picky&partner_market=eur&curr=GBP&limit=1"
  response_flight = RestClient.get(url)
  flight = JSON.parse(response_flight)
  puts flight_price = flight["data"].first["conversion"]["GBP"]
end
