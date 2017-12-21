class RoomServiceCategory < ApplicationRecord
  validates_presence_of :title

  has_many :room_service_categories_items
  has_many :items, through: :room_service_categories_items, source: :room_service_item
end
