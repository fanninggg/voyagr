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
        lng: @city.longitude#,
        # infoWindow: { content: render_to_string(partial: "/cities/map_box", locals: { city: city }) }
      }
    ]

  end
end


