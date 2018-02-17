class RoomServiceItemTagsItem < ApplicationRecord
  belongs_to :room_service_item_tag
  belongs_to :room_service_item
end