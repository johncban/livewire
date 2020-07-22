class Portfolio < ApplicationRecord
  validates_presence_of :portfolio_name, :public, presence:true

  belongs_to :user, polymorphic: true
  has_many :stocks, :dependent => :destroy
end
