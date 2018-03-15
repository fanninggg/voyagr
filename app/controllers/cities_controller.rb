require 'rest-client'
require 'date'
require 'json'
require 'open-uri'

class CitiesController < ApplicationController
  def index
    @cities = City.all.sample(3)
    @city = @cities.sample
  end

  def show
   @city = City.find(params[:id])

    @markers = [
      {
        lat: @city.latitude,
        lng: @city.longitude,
        icon: "http://res.cloudinary.com/dm2e6swvo/image/upload/c_scale,w_50/v1520525872/voyagr/black-pin.png"}]


    city_flights_in
    city_flights_out
    total_price
    cheapest_price
  end

  private

  def city_flights_out
    @city = City.find(params[:id])
    latitude = @city.latitude
    longitude = @city.longitude
    radius = "60km"
    @city_from = "LHR,LGW,LCY,STN,SEN"
    @city_to = "#{latitude.round(1)}-#{longitude.round(1)}-#{radius}"
    counter = 0
    start_date = Date.today
    @hash_out = {
      airline: [],
      price: [],
      logo: [],
      departure: [],
      arrival: [],
      atime: [],
      dtime: []
    }
    until counter  >= 4
      next_friday = start_date.next_week.advance(:days=>4)
      next_saturday = start_date.next_week.advance(:days=>5)
      url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_friday.strftime("%d/%m/%Y")}&dateTo=#{next_saturday.strftime("%d/%m/%Y")}&curr=GBP&limit=1"
      response_flight = RestClient.get(url)
      flight = JSON.parse(response_flight)
      puts flight.length

      if flight["data"].empty?
        url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_friday.strftime("%d/%m/%Y")}&dateTo=#{next_saturday.strftime("%d/%m/%Y")}&curr=GBP&limit=1&directFlights=1"
        response_flight = RestClient.get(url)
        flight = JSON.parse(response_flight)
      end

      if flight["data"].empty?
        counter = 20
      else
        airline = flight["data"].first["airlines"].first
        @hash_out[:airline] << airline
        @hash_out[:price] << flight["data"].first["conversion"]["GBP"]
        @hash_out[:logo] << "https://images.kiwi.com/airlines/64/#{airline}.png"
        @hash_out[:departure] << flight["data"].first["routes"].first.first
        @hash_out[:arrival] << flight["data"].first["routes"].first.second
        @hash_out[:dtime] << flight["data"].first["dTimeUTC"]
        @hash_out[:atime] << flight["data"].first["aTimeUTC"]
        counter += 1
        start_date = start_date.next_week
      end
    end
  end

  def city_flights_in
    @city = City.find(params[:id])
    latitude = @city.latitude
    longitude = @city.longitude
    radius = "60km"
    @city_to = "LHR,LGW,LCY,STN,SEN"
    @city_from = "#{latitude.round(1)}-#{longitude.round(1)}-#{radius}"
    counter = 0
    start_date = Date.today
    @hash_in = {
      airline: [],
      price: [],
      logo: [],
      departure: [],
      arrival: [],
      dtime: [],
      atime: []
    }

    until counter  >= 4
      next_sunday = start_date.next_week.advance(:days=>6)
      next_monday = start_date.next_week.advance(:days=>6)
      url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_sunday.strftime("%d/%m/%Y")}&dateTo=#{next_monday.strftime("%d/%m/%Y")}&curr=GBP&limit=1"
      response_flight = RestClient.get(url)
      flight = JSON.parse(response_flight)

      if flight["data"].empty?
        url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_sunday.strftime("%d/%m/%Y")}&dateTo=#{next_monday.strftime("%d/%m/%Y")}&curr=GBP&limit=1&directFlights=1"
        response_flight = RestClient.get(url)
        flight = JSON.parse(response_flight)
      end

      if flight["data"].empty?
        counter = 20
      else
        airline = flight["data"].first["airlines"].first
        @hash_in[:airline] << airline
        @hash_in[:price] << flight["data"].first["conversion"]["GBP"]
        @hash_in[:logo] << "https://images.kiwi.com/airlines/64/#{airline}.png"
        @hash_in[:departure] << flight["data"].first["routes"].first.first
        @hash_in[:arrival] << flight["data"].first["routes"].first.second
        @hash_in[:dtime] << flight["data"].first["dTimeUTC"]
        @hash_in[:atime] << flight["data"].first["aTimeUTC"]
        counter += 1
        start_date = start_date.next_week
      end
    end
  end

  def total_price
    if city_flights_in() && city_flights_out()
      @price_one = @hash_in[:price].first + @hash_out[:price].first
      @price_two = @hash_in[:price].second + @hash_out[:price].second
      @price_three = @hash_in[:price].third + @hash_out[:price].third
      @price_four = @hash_in[:price].fourth + @hash_out[:price].fourth
    end
  end

  def cheapest_price
    array = []
    array << @price_one
    array << @price_two
    array << @price_three
    array << @price_four

    @cheapest_price = array.sort.first
  end
end
