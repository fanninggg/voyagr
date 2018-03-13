require 'rest-client'

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


    params_entertainment = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{@city.latitude},#{@city.longitude}",
      radius: 50000,
      keyword: "night_club" || "amusement_park" || "aquarium" || "art_gallery" || "movie_theater" || "spa" || "casino"
    }

    response_entertainment =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_entertainment})
    @entertainment = JSON.parse(response_entertainment)


    params_sightseeing = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{@city.latitude},#{@city.longitude}",
      radius: 50000,
      keyword: "museum" || "city_hall" || "hindu_temple" || "church" || "mosque" || "synagogue"
    }

    response_sightseeing =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_sightseeing})
    @sightseeing = JSON.parse(response_sightseeing)
  end
end


