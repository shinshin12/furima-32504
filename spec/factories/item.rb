FactoryBot.define do
  factory :item do
      association :user, factory: :user
    

    item_name	        {"タオル"}
    explanation	      {"これはタオルです"}
    category_id	      {2}
    shipping_method_id {2}
    state_id	        {2}
    prefecture_id	    {2}
    day_time_id	      {2}
    price             {999999} 
    after(:build) do |item|

                      item.image.attach(io: File.open('spec/fixtures/Test.jpg'), filename: 'Test.jpg', content_type: 'jpg')
    end
  
 end
end
