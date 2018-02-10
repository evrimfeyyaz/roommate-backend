class RoomServiceCartItem < ApplicationRecord
  belongs_to :room_service_order
  belongs_to :room_service_item
  has_many :room_service_cart_items_item_choice_options
  has_many :selected_options,
           through: :room_service_cart_items_item_choice_options,
           class_name: 'RoomServiceItemChoiceOption',
           source: :room_service_item_choice_option

  validates_numericality_of :quantity, greater_than: 0, only_integer: true
end