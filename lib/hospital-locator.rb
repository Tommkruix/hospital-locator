require 'optparse'

require_relative 'api.rb'
require_relative 'storage.rb'

class HospitalLocator

    @@filter = ["cross_streets", "human_address"]
    @@arrayData = []
    @@api = Api.new("data")

    def start
        puts "Welcome to NYC Hospital Locator App"
    
        loadBoroughData("borough")
        
        puts "To exit the system kindly type in EXIT or RESTART to start over again"

            while (a = gets.chomp) != 'EXIT'
                    if(a == "RESTART")
                        puts "System restarting..."
                        self.start
                    end
                puts "You entered wrong input #{a}. To exit the system kindly type in EXIT"
            end
        
        puts "Bye!"
    end

    def loadBoroughData(type)
        puts "Loading available #{type}..."

        data = @@api.get_data
        @@arrayData = data.collect{|data| data["#{type}"] }
        @@arrayData = @@arrayData.uniq

        showArrayList(@@arrayData)

        puts "Please select your #{type}: "

        input = gets.chomp
        index = Integer(input)
        index = index-1
        arrayLength = @@arrayData.length()

            if !index.between?(0,arrayLength - 1)
                puts "Please select a number between 1 and #{arrayLength}"
                self.loadBoroughData(type)
            else
                puts "Filter with available locator criteria..."
                self.showArrayList(@@filter)
                puts "Please select a locator criteria: "
                checkFilter(type, @@arrayData[index])
                
            end

    end
    
    def showArrayList(array)
        array.each_with_index{|array, index| puts "#{index+1}- #{array}"}
    end

    def checkFilter(type, search)
        input = gets.chomp
        index = Integer(input)
        index = index-1
        arrayLength = @@filter.length()
        
            if !index.between?(0,arrayLength - 1)
                 puts "Please select a number between 1 and #{arrayLength}"
                self.checkFilter(type, search)
            else
                loadCriteriaData(@@filter[index], search)
            end
    end

    def loadCriteriaData(type, search)
        puts "Loading with locator criteria..."
        
            if (type == "cross_streets")
                data = @@api.get_criteria_data(search)
                @@arrayData = data.collect{|data| [data["facility_type"], data["#{type}"]].map(&:to_s).join(", ")  }
                @@arrayData = @@arrayData.uniq
            else
                data = @@api.get_criteria_data(search)
                @@arrayData = data.collect{|data| [data["facility_type"], data["location_1"]["human_address"][12,22] ].map(&:to_s).join(", ")  }
                @@arrayData = @@arrayData.uniq
            end
            
        showArrayList(@@arrayData)
        
    end

end

hospitalLocator = HospitalLocator.new.start

puts hospitalLocator