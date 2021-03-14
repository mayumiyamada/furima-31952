FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '中央区' }
    address { '銀座1-1-1' }
    building_name { '銀座コア' }
    phone_number { '09012345678' }
    token {'tok_abcdefghijk00000000000000000'}
    user_id { 12 }
    item_id { 11 }
  end
end
