class Hotel < ApplicationRecord
  has_many :room_service_categories
  has_many :room_service_items
  has_many :room_service_item_choices
  has_many :room_service_item_choice_options
  has_many :room_service_cart_items
  has_many :room_service_item_tags
  has_many :room_service_orders

  validates_presence_of :name
  validates_presence_of :time_zone
  validates_presence_of :currency
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain
end