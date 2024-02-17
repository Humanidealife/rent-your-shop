class Booking < ApplicationRecord
  belongs_to :shop
  belongs_to :renter, class_name: :User, foreign_key: :renter_id
end
