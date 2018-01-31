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
  end
end