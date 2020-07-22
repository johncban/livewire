class Location < ApplicationRecord
    validates_presence_of :address, :city, :state, presence:true

    has_many :appointments
    geocoded_by :appointment_address
    after_validation :geocode

    def self.by_city
        order(:city)
    end

    def appointment_address
        [address, city, state].compact.join(', ')
    end
end
