FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {'aaa@aa'}
    password  {'000aaa'}
    birthday {'1930-01-01'}
    first_name {'亜'}
    second_name {'亜'}
    first_name_kana {'ア'}
    second_name_kana {'ア'}
  end
end
