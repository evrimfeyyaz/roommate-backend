class RoomServiceItemChoicesItem < ApplicationRecord
  belongs_to :room_service_item_choice
  belongs_to :room_service_item
end
