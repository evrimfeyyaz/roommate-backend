FactoryBot.define do
  factory :room_service_category do
    sequence(:title) { |n| "Category #{n}" }

    trait :currently_unavailable do
      available_from 1.hour.from_now
      available_until 2.hours.from_now
    end
  end
end