class Appointment < ApplicationRecord
  validates_presence_of :appt_name, :appt_description, :appt_date

  belongs_to :user
  # has_many :posts, dependent: :destroy

  has_many :users, through: :locations
  has_many :locations
  accepts_nested_attributes_for :locations, allow_destroy: true

  def add_user(user)
    users.push(user)
  end

  #     def find_creator
  #         creator = User.find_by(id: self.creator_id)
  #         if creator
  #            return creator
  #            # Replace Failsafe to a flash error.
  #         else #random failsafe if author deletes profile
  #             newowner = self.users.sample
  #             self.owner_id = newowner.id
  #             self.save
  #             return newowner
  #         end
  #     end

  def self.by_name
    order(:appt_name)
  end

  def self.by_date
    order(:appt_date)
  end

  def self.by_most_recent
    a = Appointment.by_date
    a.first(5)
  end

  def self.by_location
    Appointment.all.sort_by { |appointment| appointment.appt_state }
  end

  def self.by_one_location(location)
    Appointment.all.select { |appointment| appointment.appt_city.downcase.include?(location)}
  end

  def self.by_specific_name(name)
    Appointment.all.select { |appointment| appointment.appt_name.downcase.include? name}
  end

  def self.by_specific_user(username)
    appointments = []
    users = User.all.select { |user| user.name.downcase.include?(username)}
    users.each do |user|
      if Appointment.all.select { |appointment| appointment.users.include?(user)} == []
      else
        appointments << Trip.all.select { |appointment| appointment.users.include?(user)}
      end
    end
    appointments[0]
  end
end
