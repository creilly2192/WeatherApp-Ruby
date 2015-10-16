require 'yahoo_weatherman'


#get user zip
puts "Please enter your zipcode! "
zip = gets.to_s

today = Time.now.strftime('%w').to_i

#current weather temp and condition
client = Weatherman::Client.new(unit: 'f')
location = client.lookup_by_location(zip)
temp = location.condition['temp']
condition = location.condition['text']

#5 day forecast
location.forecasts.each do |forecast|
day = forecast['date']
weekday = day.strftime('%w').to_i

if weekday == today
  dayOfWeek = 'Today'
elsif weekday == today + 1
  dayOfWeek = 'Tomorrow'
else
  dayOfWeek = day.strftime('%A')
end


forecast_low = forecast['low']
forecast_high = forecast['high']
forecast_condition = forecast['text']



puts dayOfWeek + " is going to have a low of #{forecast_low} and a high of
#{forecast_high} with an outlook of #{forecast_condition}."
end
