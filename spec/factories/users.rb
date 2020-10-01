FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    firstname            { "ぜんかく" }
    familyname             { "ぜんかく" }
    firstnamekana            { "ゼンカクカナ" }
    familynamekana             { "ゼンカクカナ" }
    birthday              { "2020-01-01" }
  end
end

