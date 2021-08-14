FactoryBot.define do
  factory :order do
    postal_code { '578-0911' }
    prefecture_id { 28 }
    city { '大阪府' }
    house_number { '中新開2丁目' }
    building_name { 'モアライフ' }
    phone_number { '09097098298' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end