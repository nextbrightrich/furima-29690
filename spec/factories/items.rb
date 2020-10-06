FactoryBot.define do
  factory :item do
    association :user
    name              { 'book' }
    price             { 400 }
    description       { 'aaa' }
    category_id       { 2 }
    status_id         { 2 }
    burden_id         { 2 }
    area_id           { 2 }
    day_id            { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
