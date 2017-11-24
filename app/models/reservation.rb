class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :plan
  belongs_to :room
  belongs_to :hotel
end
