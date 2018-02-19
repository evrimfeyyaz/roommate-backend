FactoryBot.define do
  factory :room_service_category do
    sequence(:title) { |n| "Category #{n}" }

    trait :available do
      available_from 1.hour.ago
      available_until 1.hour.from_now
    end

    trait :unavailable do
      available_from 1.hour.from_now
      available_until 2.hours.from_now
    end
  end
end