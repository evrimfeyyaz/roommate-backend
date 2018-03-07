class Stay < ApplicationRecord
  acts_as_tenant :hotel

  has_many :room_service_orders

  validates_presence_of :room_number
  validates_presence_of :began_at
end