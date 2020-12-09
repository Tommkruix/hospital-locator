#require 'pry'
#require_relative '.environment.rb'
require_relative 'storage.rb'

require 'httparty'
require 'json'

class Api
    attr_accessor :data
    @@baseUrl = "https://data.cityofnewyork.us/resource/f7b6-v6v3.json"

    def initialize(data)
        @data = data        
    end

    def get_data
        uri = URI(@@baseUrl)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    end  

    def get_criteria_data(search)
        uri = URI("#{@@baseUrl}?borough=#{search}")
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)  
    end  

end

#api = Api.new("data")
#res = api.create_data

#puts res
