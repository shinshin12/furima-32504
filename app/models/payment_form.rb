class PaymentForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message:"を正しく記入してください"}
  validates :prefecture_id, numericality: {other_than: 1}
  validates :city
  validates :house_number
  validates :phone_number, numericality: true, format: {with: /\A\d{10}\z/, message:"を正しく記入してください"}
  validates :token
  end

  def save
  purchase = Purchase.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)  
  end
end