FactoryBot.define do
  factory :stay do
    sequence(:room_number) { |n| n.to_s }
    begin_date Date.today
  end
end