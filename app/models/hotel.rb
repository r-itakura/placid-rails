class Hotel < ApplicationRecord
  has_many :room
  has_many :plan
  has_many :reservation
end
