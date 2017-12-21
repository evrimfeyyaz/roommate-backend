require 'rails_helper'

describe RoomServiceCategory do
  it { should validate_presence_of(:title) }
  it { should have_many(:items).through(:room_service_categories_items) }
end
