require 'pry'
require_relative '../environment.rb'

class Api
    attr_accessor :data 

    def initialize(data)
        @data = data
    end

    def get_data
        url = "https://data.cityofnewyork.us/resource/f7b6-v6v3"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    end     
    
    def create_data
        self.get_data.each{|data| Data.new(data["facility_type"], data["borough"], data["facility_name"], data["cross_streets"], data["phone"], data["human_address"])}
    end


end

