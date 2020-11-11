class ByCrossStreet
    attr_accessor :facility_type, :borough, :facility_name, :cross_street, :phone

    @@all = []

    def initialize(facility_type, borough, facility_name, cross_street, phone)
        @facility_type = facility_type
        @borough = borough
        @facility_name = facility_name
        @cross_street = cross_street
        @phone = phone 

    end


    def self.all
        @@all
    end

end