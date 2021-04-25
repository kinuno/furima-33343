FactoryBot.define do
  factory :order_delivery do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '福岡市' }
    housenumber { '1-1' }
    building { '福岡ハイツ' }
    telephone { '00011112222' }
    token { 'tok_abcdefghijk0000000000000000' }
  end
end
