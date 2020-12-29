FactoryBot.define do
  factory :payment_form do

    token {"tok_abcdefghijk00000000000000000"}
    postal_code   {123-1234}
    prefecture_id {2}
    city          {"横浜市緑区"}
    house_number  {"青山1-1-1"}
    building_name {"ハウスマンション"}
    phone_number  {09012341234}
  end
end
