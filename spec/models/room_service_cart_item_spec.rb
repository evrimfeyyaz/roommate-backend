require 'rails_helper'

describe RoomServiceCartItem do
  it { should belong_to(:room_service_order) }
  it { should belong_to(:room_service_item) }

  it { should validate_numericality_of(:quantity).is_greater_than(0).only_integer }
end
