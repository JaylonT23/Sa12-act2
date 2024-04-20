require 'httparty'
require 'json'

def fetch_cryptocurrency_data
  url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def sort_by_market_cap(cryptocurrencies)
  cryptocurrencies.sort_by { |crypto| -crypto['market_cap'] }
end

def display_top_5_cryptocurrencies(cryptocurrencies)
  puts "Top 5 Cryptocurrencies by Market Capitalization:"
  top_5 = cryptocurrencies.take(5)
  top_5.each_with_index do |crypto, index|
    puts "#{index + 1}. #{crypto['name']}:"
    puts "   Current Price: $#{crypto['current_price']}"
    puts "   Market Cap: $#{crypto['market_cap']}"
    puts "--------------------------------------"
  end
end

# Fetch cryptocurrency data from CoinGecko API
cryptocurrencies = fetch_cryptocurrency_data

# Sort cryptocurrencies by market capitalization in descending order
sorted_cryptocurrencies = sort_by_market_cap(cryptocurrencies)

# Display top 5 cryptocurrencies by market capitalization
display_top_5_cryptocurrencies(sorted_cryptocurrencies)
