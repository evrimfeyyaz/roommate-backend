class RoomServiceItem < ApplicationRecord
  validates_presence_of :title

  has_many :room_service_categories_items
  has_many :room_service_categories_items
  has_many :categories, through: :room_service_categories_items, source: :room_service_category
end
