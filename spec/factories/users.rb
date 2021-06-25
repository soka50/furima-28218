FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@example' }
    password { '12345a' }
    password_confirmation { '12345a' }
    first_name { '喜島' }
    last_name  { '裕一' }
    first_name_kana { 'キジマ' }
    last_name_kana  { 'ヒロカズ' }
    birth { '2006-06-21' }
  end
end
