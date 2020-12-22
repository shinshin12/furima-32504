class Item < ApplicationRecord

 belongs_to :user
 has_one_attached :image
 has_one :purchase
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :state
 belongs_to :shipping_method
 belongs_to :prefecture
 belongs_to :day_time


 with_options presence: true do
  validates :item_name
  validates :price		
  validates :explanation
  validates :image
  validates :price, numericality: true, inclusion: {in: 300..9999999, message:"は対象の値段外です"}, format: {with: /\A[0-9]+\z/, message:"を半角数字で入力してください"} 

 with_options presence: true, numericality: {other_than: 1} do
  validates :category_id
  validates :state_id
  validates :shipping_method_id
  validates :prefecture_id
  validates :day_time_id
  end
 end
end
