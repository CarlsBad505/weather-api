class WeathersController < ApplicationController

  def index
    @weather = Weather.new
  end

  def create
    sanitized_city_name = Weather.sanitize(weather_params[:search_term])
    count = Weather.where(search_term: sanitized_city_name).length
    @weather = Weather.create({search_term: sanitized_city_name, count: count += 1})
    response = Weather.get_api_data(sanitized_city_name)
    if response[1] == true && @weather.save
      puts "+"*100
      puts response[0]
      @response = response[0]
    end
  end

  private

  def weather_params
    params.require(:weather).permit(:search_term, :count)
  end
end
