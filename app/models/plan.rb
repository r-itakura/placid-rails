class Plan < ApplicationRecord
  has_many :reservation
  belongs_to :hotel
end
