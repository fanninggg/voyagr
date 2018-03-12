class SuggestionsController < ApplicationController
require "json"
  def create


    params_hotel = {
      key: "AIzaSyCPu5AKvkPmD4FX6X6GTAWXG6HorEuyCio",
      location: "#{@city.latitude},#{@city.longitude}",
      radius: 50000,
      keyword: "hotel"
    }
    @cities = City.all

    @cities.each do |suggestion|
      response_hotel =  RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', {params: params_hotel})
      @hotel = JSON.parse(response_hotel)
      ref_pic = @hotel["results"][0]["photos"][0]["photo_reference"]
      hotel_name = @hotel["results"][0]["name"]
      hotel_description = @hotel["results"][0]["vicinity"]

      hotel = Suggestion.create!(city: id, name: hotel_name, description: hotel_description, photo:ref_pic, type: "hotel")

    end
  end
end
