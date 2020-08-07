FactoryBot.define do
  factory :history do
    association :user
    association :game
    date {DateTime.now}
    text {Faker::Lorem.sentence}
  end
end
