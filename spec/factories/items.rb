FactoryBot.define do
  factory :item do
    name                    { 'aaa' }
    text                    { 'あああ' }
    category_id             { 2 }
    state_id                { 2 }
    shipping_fee_burden_id  { 2 }
    area_id                 { 2 }
    shipping_day_id         { 2 }
    price                   { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test2_image.png'), filename: 'test2_image.png')
    end
  end
end
