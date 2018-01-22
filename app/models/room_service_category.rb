class RoomServiceCategory < ApplicationRecord
  has_many :room_service_categories_items
  has_many :room_service_items, through: :room_service_categories_items

  validates_presence_of :title
end
