class Appointment < ApplicationRecord
  validates_presence_of :appt_name, :appt_description, :appt_date

  belongs_to :user

  has_many :users, through: :locations
  has_many :locations
  accepts_nested_attributes_for :locations, allow_destroy: true

  def add_user(user)
    users.push(user)
  end
end
