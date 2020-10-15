FactoryBot.define do
  factory :order_address do
    postalcode { '123-4567' }
    area_id { 14 }
    municipality { '東京都中央区' }
    housenumber { '1-1' }
    building { '東京ハイツ' }
    telephone { '09070008888' }
    token { 'tok_abcdefghijk00000000000000000'}
  end
end
