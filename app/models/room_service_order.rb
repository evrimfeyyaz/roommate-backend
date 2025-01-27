class RoomServiceOrder < ApplicationRecord
  acts_as_tenant :hotel

  belongs_to :stay
  has_many :room_service_cart_items

  validates_length_of :special_request, maximum: 255
  validates_presence_of :payment_option

  enum payment_option: %i[room_bill credit_card_on_delivery cash_on_delivery]

  accepts_nested_attributes_for :room_service_cart_items
end
