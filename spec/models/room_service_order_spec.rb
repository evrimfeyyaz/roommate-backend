require 'rails_helper'

describe RoomServiceOrder do
  it { should have_many(:room_service_cart_items) }

  it { should validate_length_of(:special_request).is_at_most(255) }
  it { should validate_presence_of(:payment_option) }
  it { should define_enum_for(:payment_option).with([:room_bill, :credit_card_on_delivery, :cash_on_delivery]) }
end
