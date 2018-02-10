FactoryBot.define do
  factory :room_service_item_choice do
    sequence(:title) { |n| "Choice #{n}" }
    optional false
    allows_multiple_selections true

    after(:build) do |choice|
      choice.room_service_item_choice_options << build_list(:room_service_item_choice_option, 2)
      choice.default_option = choice.room_service_item_choice_options.first
    end

    trait :mandatory do
      optional false
    end

    trait :optional do
      optional true
    end

    trait :single_selection do
      allows_multiple_selections false
    end

    trait :multiple_selection do
      allows_multiple_selections true
    end
  end
end