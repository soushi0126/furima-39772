class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # テーブルごとのアソシエーション
  belongs_to :user

  # アクティブハッシュのアソシエーション
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_load
  belongs_to :prefecture
  belongs_to :shipping_day


  # バリデーション設定
  with_options presence: true do
    validates :name
    validates :price, numericality: { in: 300..9999999 }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :description
      validates :category_id
      validates :situation_id
      validates :delivery_load_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end
end
