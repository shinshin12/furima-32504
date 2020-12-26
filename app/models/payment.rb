class Payment
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id :token

  with_options presence: true do
  validates :postal_code
  validates :prefecture_id
  validates :city
  validates :house_number
  validates :building_name
  validates :phone_number
  validates :token
  end

  def save
  purchase = Purchase.create(user_id: user.id, item_id: item.id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)  
  end
end