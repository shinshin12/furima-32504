class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  validates :nickname, presence: true
  validates :surname, presence: true
  validates :name, presence: true
  validates :kana_surname, presence: true
  validates :kana_name, presence: true
  validates :birthday_id, presence: true
end
