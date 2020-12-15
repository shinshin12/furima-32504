class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /[a-z\d]{6,}/i
  validastes :password, pressence:true, format: {with: VALID_PASSWORD_REGEX}
    
  validates :nickname, presence: true
  validates :surname, presence: true, format: {with: [^ -~｡-ﾟ]*$/}
  validates :name, presence: true, format: {with: [^ -~｡-ﾟ]*$/}
  validates :kana_surname, presence: true, format: {with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :kana_name, presence: true, format: {with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :birthday_id, presence: true
end