FactoryBot.define do
  factory :item do 
    product_name { 'ゲーム' }
    product_info { '面白い' }
    category_id { 3 }
    product_condition_id { 4 }
    shipping_charge_id { 5 }
    prefecture_id { 6 }
    day_to_ship_id { 7 }
    price  { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end