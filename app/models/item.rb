class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # テーブルごとのアソシエーション
  belongs_to :user
  has_one :purchase

  # アクティブハッシュのアソシエーション
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_load
  belongs_to :prefecture
  belongs_to :shipping_day

  # アクティブストレージのアソシエーション
  has_one_attached :image

  # バリデーション設定
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :situation_id
      validates :delivery_load_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end
end
