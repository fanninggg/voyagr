require 'rest-client'

class CitiesController < ApplicationController
  def index

    if @cities = City.where.not(latitude: nil, longitude: nil)
       @markers = @cities.map do |city|
        {
          lat: city.latitude,
          lng: city.longitude#,
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
        icon: "http://res.cloudinary.com/dm2e6swvo/image/upload/c_scale,w_50/v1520525872/voyagr/black-pin.png"#,
        # infoWindow: { content: render_to_string(partial: "/cities/map_box", locals: { city: city }) }
      }

    end
    # check_in_date = 2.weeks.from_now
    # check_out_date = 4.weeks.from_now
    # params = {
    #   apikey: "LVZKpIaTnRcGpiHZrVqA6tS4xJNyZUFC",
    #   latitude: @city.latitude,
    #   longitude: @city.longitude,
    #   radius: 10,
    #   check_in: check_in_date,
    #   check_out: check_out_date
    # }

    # RestClient.get('https://api.sandbox.amadeus.com/v1.2/hotels/search-circle', params, headers: {apikey: "LVZKpIaTnRcGpiHZrVqA6tS4xJNyZUFC"})
    # url: 'https://api.sandbox.amadeus.com/v1.2/hotels/search-circle',
    # {apikey: "LVZKpIaTnRcGpiHZrVqA6tS4xJNyZUFC",
    # latitude: @city.latitude,
    # longitude: @city.longitude,
    # radius: 10,
    # check_in: check_in_date,
    # check_out: check_out_date}
  

end


