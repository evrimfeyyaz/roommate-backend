class RoomServiceItem < ApplicationRecord
  has_many :room_service_categories_items
  has_many :room_service_categories, through: :room_service_categories_items

  validates_presence_of :title
  validates_numericality_of :price, greater_than_or_equal_to: 0
end
