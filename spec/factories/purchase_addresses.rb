FactoryBot.define do
  factory :purchase_address do
    post_number { '111-1111' }
    pref_id { '2' }
    city { '東京' }
    mail { '中央区2-2' }
    tell { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    build {'タワー111'}
    user_id {"2"}
    item_id {"2"}
  end
end
