require 'rails_helper'

describe RoomServiceItem do
  it { should validate_presence_of :title }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { should have_many(:categories).through(:room_service_categories_items) }
end
