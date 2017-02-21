class WeathersController < ApplicationController

  def index
    @weather = Weather.new
    @history = Weather.distinct(:search_term)
  end

  def create
    sanitized_city_name = Weather.sanitize(weather_params[:search_term])
    @record = Weather.find_by(search_term: sanitized_city_name)
    @weather = Weather.create({search_term: sanitized_city_name, count: 1}) unless @record != nil
    @weather = @record.update(count: @record.count += 1) unless @record == nil
    @history = Weather.distinct(:search_term)
    response = Weather.get_api_data(sanitized_city_name)
    if response[1] == true
      @response = response[0]
    elsif response[1] == false
      @response = response[0]
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def weather_params
    params.require(:weather).permit(:search_term, :count)
  end
end
