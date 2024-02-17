class Shop < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
