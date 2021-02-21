FactoryBot.define do
  factory :pay_street_address do
    postal_code    { '123-4567' }
    area_id        { 3 }
    municipalities { 'あああ' }
    address        { 'いいい' }
    place          {'ううう'}
    tel            { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
