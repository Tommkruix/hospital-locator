class Storage
    attr_accessor :facility_type, :borough, :facility_name, :cross_streets, :phone, :human_address

    def initialize(facility_type, borough, facility_name, cross_streets, phone, human_address)
        @facility_type = facility_type
        @borough =  borough
        @facility_name = facility_name
        @cross_streets = cross_streets
        @phone = phone
        @human_address =human_address
    end

end

