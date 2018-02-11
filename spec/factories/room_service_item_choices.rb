FactoryBot.define do
  factory :room_service_item_choice do
    sequence(:title) { |n| "Choice #{n}" }

    after(:build) do |choice|
      choice.room_service_item_choice_options << build_list(:room_service_item_choice_option, 2)
    end
  end
end