FactoryBot.define do
  factory :temporary_token do
    sequence(:device_ip) { |n| "#{n}.#{n}.#{n}.#{n}" }
  end
end