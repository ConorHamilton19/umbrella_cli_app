class Umbrella::CLI 
  attr_accessor :rain
  
  def call 
    choose_location
    gonna_rain
    further_prompt
    choose
  end 
  
  def choose_location
      puts "Do you need an Umbrella today in:(pick a number)"
      
        ["Chicago, IL", "New York, NY", "Los Angeles, CA"].each.with_index(1){|a, i| puts "#{i}. #{a}"}
        
        input = gets.chomp.downcase 
        case input
        when "1"
          if Umbrella::Weather.find_by_city("Chicago, IL") == nil
           @rain = Umbrella::Scraper.weather_setter("Chicago+IL+USIL0225:1:US")
          else
           @rain = Umbrella::Weather.find_by_city("Chicago, IL")
          end 
           
        when "2"
            if Umbrella::Weather.find_by_city("New York, NY") == nil
           @rain = Umbrella::Scraper.weather_setter("USNY0996:1:US")
            else 
            @rain = Umbrella::Weather.find_by_city("New York, NY")
          end
            
        when "3"
          if Umbrella::Weather.find_by_city("Los Angeles, CA") == nil
          @rain = Umbrella::Scraper.weather_setter("USCA0638:1:US")
          else
          @rain = Umbrella::Weather.find_by_city("Los Angeles, CA")
        end 
        when "exit"
          puts "Stay dry!"
          exit 
        else
          puts "Please try a number 1-3."
          choose_location
        end 
    end 
  
  def gonna_rain
    if @rain.rain_perc != "0%"
      puts ""
      puts "Looks like rain is in the forecast, better grab an umbrella! The chance of rain is #{@rain.rain_perc}."
      puts ""
    else
      puts ""
      puts "No rain today! Leave that umbrella at home."
      puts ""
    end 
  end 
  
  
  def further_prompt
    puts "Would you like to know more about today's weather(y/n):"
    input = gets.chomp.downcase
    if input == "y"
      puts "
        1) Weather Report
        2) Temperature
        3) Weather Condition
        4) Wind Speed
        5) Sunrise/Sunset
                          "
    else 
      puts "Stay dry!"
      exit 
    end 
  end
  
  def choose            
    choice = nil
    while choice != "exit"
      puts "Choose a number, type 'list' to see options again, type 'city' to change location, or 'exit' to leave."
            
            choice = gets.chomp
            
            case choice
            when "1" 
              puts ""
              puts "Weather Report:
              Temperature- #{@rain.temperature}
              Condition- #{@rain.weather_condition}
              Wind- #{@rain.wind}
              Sunrise- #{@rain.sunrise}, Sunset - #{@rain.sunset}
              "
              puts ""
            when "2"
              puts ""
              puts "#{@rain.temperature}"
              puts ""
            when "3"
              puts ""
              puts "#{@rain.weather_condition}"
              puts ""
            when "4"
              puts ""
              puts "#{@rain.wind}"
              puts ""
            when "5"
              puts ""
              puts "Sunrise- #{@rain.sunrise}, Sunset - #{@rain.sunset}"
              puts ""
            when "exit"
              puts ""
              puts "Stay dry!"
              puts ""
              exit
            when "list"
              puts "
                1) Weather Report
                2) Temperature
                3) Weather Condition
                4) Wind Speed
                5) Sunrise/Sunset

                              "
          when "city"
            call
            else
              puts "Did not understand that commmand."
            end  
      end
  end 
  
end 