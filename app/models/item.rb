class Item < ApplicationRecord

 belongs_to :user
 has_one_attached :image



 with_options presence: true do
 item_name		
 explanation	
 category_id	
 state_id	
 shipping_method_id	
 profecture_id	
 date_id	
 price
 end
end
