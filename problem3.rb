require 'httparty'
require 'json'

def fetch_current_time(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def format_current_time(time_data, area, location)
  current_date = time_data['datetime'].split('T')[0]
  current_time = time_data['datetime'].split('T')[1].split('.')[0]
  "The current time in #{area}/#{location} is #{current_date} #{current_time}"
end

# Specify the area and location for the timezone
area = 'North America'
location = 'Tennessee'

# Fetch current time from WorldTimeAPI
time_data = fetch_current_time(area, location)

# Format and display the current time
formatted_time = format_current_time(time_data, area, location)
puts formatted_time
