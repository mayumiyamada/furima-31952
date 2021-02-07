FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"真由美"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"マユミ"}
    birthday              {"2000-01-01"}
  end
end