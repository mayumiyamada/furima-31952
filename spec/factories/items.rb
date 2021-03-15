FactoryBot.define do
  factory :item do
    name                    { 'ベビーカー' }
    info                    { 'サイベックスシリーズ、ミオス' }
    price                   { 99_999 }
    category_id             { 3 }
    sales_status_id         { 1 }
    shopping_fee_status_id  { 1 }
    prefecture_id           { 1 }
    scheduled_delivery_id   { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('./app/assets/images/bora-bora.png'), filename: 'bora-bora.png')
    end
  end
end
