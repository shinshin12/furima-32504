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
  validates :image
 end
 validates :price, numericality: {with: /\A[0-9]+\z/, message:"を半角数字で入力してください"}, presence: true, length: {maximum: 7, message: "値が大きすぎます"}

validates :category_id,	numericality: { other_than: 1 }
validates :state_id, numericality: { other_than: 1 }
validates :shipping_method_id, numericality: { other_than: 1 }	
validates :prefecture_id,	numericality: { other_than: 1 }
validates :day_time_id, numericality: { other_than: 1 }
end
