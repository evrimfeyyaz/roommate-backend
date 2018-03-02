require 'rails_helper'

describe Hotel do
  it { should have_many(:room_service_categories) }
  it { should have_many(:room_service_items) }
  it { should have_many(:room_service_item_choices) }
  it { should have_many(:room_service_item_choice_options) }
  it { should have_many(:room_service_cart_items) }
  it { should have_many(:room_service_item_tags) }
  it { should have_many(:room_service_orders) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:time_zone) }
  it { should validate_presence_of(:currency) }
  it { should validate_presence_of(:subdomain) }
  it { should validate_uniqueness_of(:subdomain) }
end