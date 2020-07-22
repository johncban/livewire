class Appointment < ApplicationRecord
  validates_presence_of :name, :description, :appointment_date, :public, presence: true
    
    belongs_to :user, polymorphic: true
    belongs_to :location, polymorphic: true
    has_and_belongs_to_many :users
    has_many :posts
    
    accepts_nested_attributes_for :location

    def add_user(user)
        self.users.push(user)
    end

    def find_friends(user)
        potential = user.friends
        potential.select{
            |u| self.users.all.exclude?(u)
        }
    end

    def find_creator
        creator = User.find_by(id: self.creator_id)
        if creator
            return creator
        else
            newuser = self.users.sample
            self.creator_id = newuser.id
            self.save
            return newuser
        end
    end

    def self.by_name
        order(:name)
    end

    def self.by_date
        order(:date)
    end

    def self.by_most_recent
        a = Appointment.by_date
        a.first(5)
    end

    def self.by_location
        Appointment.all.sort_by {|appointment| appointment.location.state}
    end

    def self.by_one_location location
        Appointment.all.select{|appointment| appointment.location.city.downcase.include?(location)}
    end

    def self.by_specific_name name 
        Appointment.all.select{|trip| trip.name.downcase.include? name}
    end

    def self.by_specific_user username
        appointments = []
        users = User.all.select{|user| user.name.downcase.include?(username)}
        users.each do |user|
            if Appointment.all.select{|appointment| appointment.users.include?(user)} == []
            else
            appointments << Appointment.all.select{|appointment| appointment.users.include?(user)}
            end
        end
        appointments[0]
    end

    def location_attributes=(location_attributes)
        self.build_location(location_attributes)
    end

end
