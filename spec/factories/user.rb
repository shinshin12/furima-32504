FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
      end


password            {"aaa000"} 
    password_confirmation     {password}         
email               {Faker::Internet.free_email}           
nickname            {"satou"} 
surname             {"佐藤"}       
name                {"孝宏"}         
kana_surname        {"サトウ"}          
kana_name           {"タカヒロ"}         
birthday            {Faker::Date.birthday}           
   end
end