FactoryBot.define do
  factory :room_service_item do
    sequence(:title) { |n| "Item #{n}" }
  end
end