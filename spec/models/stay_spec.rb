require 'rails_helper'

describe Stay do
  it_behaves_like 'a tenant model'

  it { should have_many(:room_service_orders) }

  it { should validate_presence_of(:room_number) }
  it { should validate_presence_of(:began_at) }
end
