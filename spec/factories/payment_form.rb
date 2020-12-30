FactoryBot.define do
  factory :payment_form do
    association :user_id, factory: :user
    association :item_id, factory: :item

    token {"tok_abcdefghijk00000000000000000"}
    postal_code   {"123-1234"}
    prefecture_id {2}
    city          {"横浜市緑区"}
    house_number  {"青山1-1-1"}
    building_name {"ハウスマンション"}
    phone_number  {"1234567891"}
  end
end
