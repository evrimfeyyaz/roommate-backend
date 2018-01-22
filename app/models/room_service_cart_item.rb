class RoomServiceCartItem < ApplicationRecord
  belongs_to :room_service_order
  belongs_to :room_service_item

  validates_numericality_of :quantity, greater_than: 0, only_integer: true
end
