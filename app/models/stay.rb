class Stay < ApplicationRecord
  acts_as_tenant :hotel

  validates_presence_of :room_number
  validates_presence_of :begin_date
end
