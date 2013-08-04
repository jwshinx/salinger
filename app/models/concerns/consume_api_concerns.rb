module ConsumeApiConcerns
    
  def find_sonoma_weather
    @sonoma_weather = OpenWeatherMapService.new('http://api.openweathermap.org/data/2.5/forecast?id=5397095&units=imperial')
  end
  
end