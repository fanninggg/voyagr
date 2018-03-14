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
  end
  
  private

  def city_flights_out
    @city = City.find(params[:id])
    latitude = @city.latitude
    longitude = @city.longitude
    radius = "30km"
    @city_from = "LHR,LGW,LCY,STN,SEN"
    @city_to = "#{latitude.round(1)}-#{longitude.round(1)}-#{radius}"
    counter = 0
    start_date = Date.today
    @hash_out = {
      airline: [],
      price: [],
      logo: []
    }
    until counter  >= 4
      next_friday = start_date.next_week.advance(:days=>4)
      next_saturday = start_date.next_week.advance(:days=>5)
      url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_friday.strftime("%d/%m/%Y")}&dateTo=#{next_saturday.strftime("%d/%m/%Y")}&directFlights=0&partner=picky&partner_market=eur&curr=GBP&limit=1"
      response_flight = RestClient.get(url)
      flight = JSON.parse(response_flight)
      airline = flight["data"].first["airlines"].first
      @hash_out[:airline] << airline
      @hash_out[:price] << flight["data"].first["conversion"]["GBP"]
      @hash_out[:logo] << "https://images.kiwi.com/airlines/64/#{airline}.png"
      counter += 1
      start_date = start_date.next_week
    end
  end

  def city_flights_in
    @city = City.find(params[:id])
    latitude = @city.latitude
    longitude = @city.longitude
    radius = "30km"
    @city_to = "LHR,LGW,LCY,STN,SEN"
    @city_from = "#{latitude.round(1)}-#{longitude.round(1)}-#{radius}"
    counter = 0
    start_date = Date.today
    @hash_in = {
      airline: [],
      price: [],
      logo: []
    }
    until counter  >= 4
      next_sunday = start_date.next_week.advance(:days=>6)
      next_monday = start_date.next_week.advance(:days=>6)
      url = "https://api.skypicker.com/flights?flyFrom=#{@city_from}&to=#{@city_to}&dateFrom=#{next_sunday.strftime("%d/%m/%Y")}&dateTo=#{next_monday.strftime("%d/%m/%Y")}&directFlights=0&partner=picky&partner_market=eur&curr=GBP&limit=1"
      response_flight = RestClient.get(url)
      flight = JSON.parse(response_flight)
      airline = flight["data"].first["airlines"].first
      @hash_in[:airline] << airline
      @hash_in[:price] << flight["data"].first["conversion"]["GBP"]
      @hash_in[:logo] << "https://images.kiwi.com/airlines/64/#{airline}.png"
      counter += 1
      start_date = start_date.next_week
    end
  end

end
