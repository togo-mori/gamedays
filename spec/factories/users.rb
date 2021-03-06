FactoryBot.define do 
  factory :user do 
    name {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
  end
end