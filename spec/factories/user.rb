FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
      end


password            {Faker::Internet.password(min_length: 6)}           
email               {Faker::Internet.free_email}           
nickname            {Faker::Name.name} 
surname             {person.first.kanji}       
name                {person.last.kanji}         
kana_surname        {person.first.katakana}          
kana_name           {person.last.katakana}         
birthday            {Faker::Date.backword}           
   end
end