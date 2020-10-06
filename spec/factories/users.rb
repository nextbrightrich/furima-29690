FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'Aaa111'}
    password_confirmation { password }
    firstname { 'ぜんかく' }
    familyname { 'ぜんかく' }
    firstnamekana { 'ゼンカクカナ' }
    familynamekana { 'ゼンカクカナ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end

# '1a' + Faker::Internet.password(min_length: 6)
