FactoryBot.define do
  factory :item do
    nickname { 'test' }
    message { 'aaaaa' }
    fee { 300 }
    quality_id { 2 }
    pref_id { 2 }
    delivery_charge_id { 2 }
    shipping_date_id { 2 }
    category_id { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
