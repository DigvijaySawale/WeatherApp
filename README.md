# Weather Forecast App

A simple Ruby on Rails application based on the latest version of Ruby-3 and Rails-8 that fetches weather forecast information using OpenWeatherMap API, caches the previouse results and displays the results on search.

Usage and Feature:

* Accepts City name or Zip code as input

* Retrieves current temperature along with high/low and weather description 

* Caches the results for 30 minutes per address for faster results and displays whether result is fetched from cache

* Integrated Bootstrap nav bar and components for better styling and have scope to add more feature in future.


Tech Stack:
  * Ruby on Rails(LTS)

  * BootStrap 5 for styling
  
  * HTTParty for API requests

  * Rails cache

  * OpenWeatherMap API key