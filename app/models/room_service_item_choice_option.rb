class RoomServiceItemChoiceOption < ApplicationRecord
  belongs_to :room_service_item_choice

  validates_presence_of :title
  validates_numericality_of :price, greater_than_or_equal_to: 0, allow_nil: true
end