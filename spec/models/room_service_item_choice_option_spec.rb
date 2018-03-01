require 'rails_helper'

describe RoomServiceItemChoiceOption do
  it_behaves_like 'a tenant model'

  it { should belong_to(:hotel) }
  it { should belong_to(:room_service_item_choice) }

  it { should validate_presence_of :title }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should allow_value(nil).for(:price) }
end