FactoryBot.define do
  factory :stay do
    sequence(:room_number) { |n| n.to_s }
    began_at Time.current
  end
end