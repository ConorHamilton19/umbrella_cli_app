class Umbrella::Weather
   attr_accessor :temperature, :wind, :sunrise, :sunset, :weather_condition, :rain_perc, :city
  
  @@all = []
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.find_by_city(city)
    self.all.find{|a| a.city == city}
  end 
  
end 
  