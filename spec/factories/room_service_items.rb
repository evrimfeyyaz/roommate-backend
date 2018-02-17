FactoryBot.define do
  factory :room_service_item do
    sequence(:title) { |n| "Item #{n}" }
    price 9.999

    trait :with_thumbnail do
      thumbnail { Rails.root.join('seed/smoked-salmon-eggs-benedict-thumbnail.jpg').open }
    end

    trait :with_image do
      image { Rails.root.join('seed/baked-dijon-salmon.jpg').open }
    end

    trait :with_tag do
      after(:build) do |item|
        item.room_service_item_tags << build(:room_service_item_tag)
      end
    end

    factory :room_service_item_with_choices do
      transient do
        choices_count 2
      end

      after(:build) do |item, evaluator|
        item.room_service_item_choices << build_list(:room_service_item_choice, evaluator.choices_count)
      end
    end
  end
end