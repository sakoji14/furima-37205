FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    birthday { '1930-01-01' }
    first_name { '亜' }
    second_name { '亜' }
    first_name_kana { 'ア' }
    second_name_kana { 'ア' }
  end
end
