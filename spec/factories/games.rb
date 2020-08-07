FactoryBot.define do
  factory :game do
    title {Faker::Game.title}
    maker {Faker::Company.name}
    series {Faker::Game.genre}
    hard {Faker::Game.platform}
    year {Faker::Number.number(digits: 4)}
    # after(:create) do |game|
    #   game.users << FactoryBot.create(:user)
    # end
  end
end
