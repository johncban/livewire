class Location < ApplicationRecord
    validates_presence_of :appt_address, :appt_city, :appt_state

    belongs_to :user 
    belongs_to :appointment

    geocoded_by :actual_location
    after_validation :geocode

    def self.by_city
        order(:appt_city)
    end

    def actual_location
        [appt_address, appt_city, appt_state].compact.join(', ')
    end
end
