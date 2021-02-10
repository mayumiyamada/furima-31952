FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    last_name             { '山田' }
    first_name            { 'まゆみ' }
    last_name_kana        { 'アアア' }
    first_name_kana       { 'イイイイイ' }
    birthday              { '2000-01-01' }
  end
end
