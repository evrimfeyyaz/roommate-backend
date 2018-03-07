require 'rails_helper'

describe Stay do
  it_behaves_like 'a tenant model'

  it { should validate_presence_of(:room_number) }
end
