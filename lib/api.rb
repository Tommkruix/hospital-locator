#require 'pry'
#require_relative '.environment.rb'
require_relative 'storage.rb'


require 'httparty'
require 'json'

class Api
    attr_accessor :data

    def initialize(data)
        @data = data        
    end

    def get_data
        #url = "https://data.cityofnewyork.us/resource/f7b6-v6v3.json"
        url = "https://data.cityofnewyork.us/resource/f7b6-v6v3.json?borough=Bronx"
        #url = "https://vpic.nhtsa.dot.gov/api/vehicles/getmanufacturerdetails/toyota?format=json"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)

        #data["data"][1..10]

             
    end     
    
    def create_data
        #self.get_data.find{|data| data.new(data["facility_type"], data["borough"], data["facility_name"], data["cross_streets"], data["phone"], data["human_address"])}
        self.get_data.find{|data| data.new(data["facility_type"], data["borough"], data["facility_name"], data["cross_streets"], data["phone"], data["human_address"])}
    end


    

end

api = Api.new("data")
# binding.pry
# "This is pry"
hash = api.get_data

#hash.keep_if{ |key, val| key == "facility_type" }

# hash.each do |key, value|
#     #puts "#{key}: #{value}"
    
#     puts key
#     puts value
# end

puts hash

