

require 'rubygems' 
require 'oauth' 
require 'pry'
require 'json'

require_relative "lib/location"
require_relative "lib/service_professional"

consumer_key = 'WSvgdlx-IM9bra36-zpRdA'
consumer_secret = 'AjbpBSU1qF8mW2O0RvcDOxXXg94'
token = 'K-5dY6Q0c3scWpEyvOtEo25_CbhILi9V'
token_secret = '1MY8I7ySCx6F-NJJXnFHImEOeMQ'


api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})

access_token = OAuth::AccessToken.new(consumer, token, token_secret)

# the code below displays the name of the restaurant and also shows if the restaurant is current closed 
# or open.
parsed["businesses"].each do |restaurant|
  puts "name: " + restaurant["name"] + " is closed? " + restaurant["is_closed"].to_s
end

#Asks user for the city where they're looking for a service professional
def get_location
	puts "What city are you looking for a service professional?"
	location = Location.new(gets.strip)
	if location.verify? = false
		puts "That is not a valid city. Please try again."
		get_location
	end
end

#Asks user for the type of professional that they're looking for
def get_query
	puts "What kind of service professional are you looking for (eg: plumber)"
	query = Service_Professional.new(gets.strip)
	if query.verify? = false
		puts "That is not a valid category of service professional. Please try again."
		get_query
	end
end

def run_search
	puts "Welcome. Here you can find business information for the service professionals in your city."
	location = get_location
	query = get_query
	path = "/v2/search?term=#{service_pr}&location=#{location}&limit=1"
	response = access_token.get(path).body
	parsed = JSON.load(response) 
	# Returns all users and their star rating
	parsed["businesses"].each do |business|
 		puts business["name"]
	end
	puts "Would you like to perform another search? (y/n)"
	reply = gets.strip
	if reply == 'y'
		run_search
	else
		puts "Bai!"

end

run_search









