class ByPhysicalAddress
    attr_accessor :facility_type, :borough, :facility_name, :phone, :human_address

    @@all = []

    def initialize(facility_type, borough, facility_name, phone, human_address)
        @facility_type = facility_type
        @borough = borough
        @facility_name = facility_name
        @phone = phone 
        @human_address = human_address
    end


    def self.all
        @@all
    end

end