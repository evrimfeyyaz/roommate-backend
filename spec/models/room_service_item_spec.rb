require 'rails_helper'

describe RoomServiceItem do
  it { should validate_presence_of :title }
  it { should have_many(:categories).through(:room_service_categories_items) }
end
