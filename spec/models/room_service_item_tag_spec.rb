require 'rails_helper'

describe RoomServiceItemTag do
  it_behaves_like 'a tenant model'

  it { should validate_presence_of :title }

  it { should belong_to(:hotel) }
  it { should have_many(:room_service_items).through(:room_service_item_tags_items) }
end
