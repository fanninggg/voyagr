require 'rest-client'

class CitiesController < ApplicationController
  def index

    if @cities = City.where.not(latitude: nil, longitude: nil)
       @markers = @cities.map do |city|
        {
          lat: city.latitude,
          lng: city.longitude,

        # infoWindow: { content: render_to_string(partial: "/cities/map_box", locals: { city: city }) }
        }
      end
    else
      @cities = City.all
    end
  end

  def show
    @city = City.find(params[:id])

    @markers = [
      {
        lat: @city.latitude,
        lng: @city.longitude,
        icon: "http://res.cloudinary.com/dm2e6swvo/image/upload/c_scale,w_50/v1520525872/voyagr/black-pin.png"}]
        # infoWindow: { content: render_to_string(partial: "/cities/map_box", locals: { city: city }) }

    params_hotel = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{@city.latitude},#{@city.longitude}",
      radius: 50000,
      keyword: "hotel"
    }

    response_hotel =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_hotel})
    @hotel = JSON.parse(response_hotel)
    # rescue
      # @hotel = "Not found"

    params_restaurant = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{@city.latitude},#{@city.longitude}",
      radius: 50000,
      keyword: "restaurant" || "cafe"
    }

    response_restaurant =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_restaurant})
    @restaurant = JSON.parse(response_restaurant)
    # rescue
      # @restaurant = "Not found"

    params_entertainment = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{@city.latitude},#{@city.longitude}",
      radius: 50000,
      keyword: "night_club" || "amusement_park"
    }

    response_entertainment =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_entertainment})
    @entertainment = JSON.parse(response_entertainment)
    # rescue
      # @entertainment = "Not found"
  end
end


