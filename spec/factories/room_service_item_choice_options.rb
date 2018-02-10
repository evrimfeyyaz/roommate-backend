FactoryBot.define do
  factory :room_service_item_choice_option do
    sequence(:title) { |n| "Option #{n}" }
  end
end