FactoryBot.define do
  factory :room_service_item_tag do
    sequence(:title) { |n| "Item Tag #{n}" }
  end
end