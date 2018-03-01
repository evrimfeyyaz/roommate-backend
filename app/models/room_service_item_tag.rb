class RoomServiceItemTag < ApplicationRecord
  acts_as_tenant :hotel

  belongs_to :hotel
  has_many :room_service_item_tags_items
  has_many :room_service_items, through: :room_service_item_tags_items

  validates_presence_of :title
end
