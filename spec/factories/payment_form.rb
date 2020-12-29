FactoryBot.define do
  factory :payment_form do
    association :user_id
    association :item_id

    token {"tok_abcdefghijk00000000000000000"}
    postal_code   {"123-1234"}
    prefecture_id {2}
    city          {"横浜市緑区"}
    house_number  {"青山1-1-1"}
    phone_number  {12345678}
  end
end
