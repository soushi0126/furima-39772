class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :fast_name, presence: true
  validates :last_name_kana, presence: true
  validates :fast_name_kana, presence: true
  validates :date_of_birth, presence: true

  
end
