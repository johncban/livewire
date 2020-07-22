class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :appointments
  has_and_belongs_to_many :portfolios
  has_many :posts
end
