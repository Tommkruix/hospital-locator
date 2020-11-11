class HospitalLocator

    @@boro = ["Brooklyn", "Queens", "Bronx", "Manhattan", "Staten Island"]

    def start
        puts "Welcome to NYC Hospital Locator App"
        puts "Please select a number corresponding to your Borough"
        self.show_boro
    end

    def self.boro
        @@boro
    end

    def show_boro
        HospitalLocator.boro.each_with_index{|boro, index| puts "#{index+1}- #{boro}"}
    end


end

