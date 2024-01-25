class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :street_address
    validates :telephone, format: { with: /\A\d{10}$|^\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, 
                    street_address: street_address, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end