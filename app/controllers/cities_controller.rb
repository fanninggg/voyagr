class CitiesController < ApplicationController
  def index
    @cities = City.all

    @cities = City.where.not(latitude: nil, longitude: nil)

    @markers = @cities.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end



  end

  def show
    @city = City.find(params[:id])
    @cities = City.where.not(latitude: nil, longitude: nil)

    @markers = @cities.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end
end
