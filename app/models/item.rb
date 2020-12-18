class Item < ApplicationRecord

 belongs_to :user
 has_one_attached :image
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :state
 belongs_to :shipping_method
 belongs_to :prefecture
 belongs_to :day_time


 with_options presence: true do
  validates :item_name		
  validates :explanation	
  validates :price
 end

validates :category_id,	numericality: { other_than: 1 }
validates :state_id, numericality: { other_than: 1 }
validates :shipping_method_id, numericality: { other_than: 1 }	
validates :prefecture_id,	numericality: { other_than: 1 }
validates :day_time_id, numericality: { other_than: 1 }
end
