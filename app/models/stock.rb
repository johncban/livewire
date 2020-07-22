class Stock < ApplicationRecord
  validates_presence_of :symbol, :quantity, presence:true

  belongs_to :users
  belongs_to :portfolios
end
