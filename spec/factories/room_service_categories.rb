FactoryBot.define do
  factory :room_service_category do
    sequence(:title) { |n| "Category #{n}" }
  end
end