FactoryBot.define do
  factory :room_service_item do
    sequence(:title) { |n| "Item #{n}" }
    price 9.999

    factory :room_service_item_with_thumbnail do
      thumbnail { Rails.root.join('seed/smoked-salmon-eggs-benedict-thumbnail.jpg').open }
    end
  end
end