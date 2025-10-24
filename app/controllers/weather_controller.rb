class WeatherController < ApplicationController
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def index
  end

  def forecast
    @address  = params[:address ]
    #redirect if address is blank
    return redirect_to root_path, alert: "Please Enter Address" if @address.blank?

    result = Geocoder.search(@address )

    if result.empty?
      return redirect_to root_path, alert: "Invalid Address, Please enter proper address"
    end

    #fetching latitude and longitude based on result
    latitude, longitude = result.first.coordinates 

    #unique key based on address
    cache_key = "weather_#{@address .parameterize}"
    cached_data = Rails.cache.read(cache_key)

    #if cached data present the use it
    if cached_data.present?
      @weather_data = cached_data
      @from_cache = true
    else 
      api_key = ENV['OPENWEATHER_API_KEY']
      api_params =  {
        'lat' => latitude,
        'lon' => longitude,
        'units' => "metric",
        'appid' => api_key
      }

      #fetch weather using openweathermap api
      response = self.class.get("/weather", query: api_params)
      if response.success?
        data = response.parsed_response
        @weather_data = {
          temp: data["main"]["temp"],
          high: data["main"]["temp_max"],
          low: data["main"]["temp_min"],
          description: data["weather"][0]["description"]
        }

        #write to cache for newly fetched weather data
        Rails.cache.write(cache_key, @weather_data, expires_in: 30.minutes)
        @from_cache = false
      else
        return redirect_to root_path, alert: "Unable to fetch forecast data"
      end
    end
    render :index

  end

  def about
    #controller action to show about page
  end

end
