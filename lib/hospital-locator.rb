class HospitalLocator

    @@boro = ["facility_type", "borough", "facility_name", "cross_streets", "phone", "human_address"]

    def start
        puts "Welcome to NYC Hospital Locator App"
        puts "Please select a number corresponding to your Borough"
        self.show_boro
        api = Api.new("data", "boro")
        api.create_data

    end

    def self.boro
        @@boro
    end


    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,5)
            puts "Please select a number between 1 and 6"
            self.initial_input
        else 
            index
        end
    end

    def show_boro
        HospitalLocator.boro.each_with_index{|boro, index| puts "#{index+1}- #{boro}"}
    end

end

