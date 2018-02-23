FactoryBot.define do
  factory :hotel do
    sequence(:title) { |n| "Hotel #{n}" }
    time_zone ActiveSupport::TimeZone[0].name
    currency 'BHD'
    sequence(:subdomain) { |n| "hotel#{n}" }
  end
end