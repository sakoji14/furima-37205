FactoryBot.define do
  factory :address do
    post_number { '111-1111' }
    pref_id { '2' }
    city { '東京' }
    mail { '中央区2-2' }
    tell { '08012345678' }
  end
end
