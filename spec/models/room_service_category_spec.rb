require 'rails_helper'

describe RoomServiceCategory do
  it { should have_many(:room_service_items).through(:room_service_categories_items) }

  it { should validate_presence_of(:title) }
end
