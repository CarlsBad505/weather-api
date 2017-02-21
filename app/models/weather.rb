class Weather < ApplicationRecord
  require 'open-uri'

  validates :search_term,
    presence: true,
    length: { minimum: 1 }

  def self.get_api_data(city_name)
    begin
      link = "http://weathers.co/api.php?city=#{city_name}"
      data = open(link).read
      obj = JSON.parse(data, symbolize_names: true)
      if obj[:data].has_key?(:error)
        return obj[:data][:error], false
      else
        return obj[:data], true
      end
    rescue
      return "weathers.co api is currently down", false
    end
  end

  def self.sanitize(city_name)
    sanitized_city_name = city_name.lstrip.rstrip.gsub(/[,.-]/, '').downcase
    sanitized_city_name
  end

end
