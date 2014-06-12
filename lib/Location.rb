class Location
	attr_accessor :city
	def initialize (city)
		@city = city
	end
	def verify?
		if @city.is_a?(String)
			puts " is not a city. Please input a diff city."
			@city = @city.capitalize
		else
			false
	end
end