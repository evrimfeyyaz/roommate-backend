class RoomServiceCategoriesItem < ApplicationRecord
  belongs_to :room_service_category
  belongs_to :room_service_item
end
