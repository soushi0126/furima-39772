require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入情報の保存' do
    context '商品が購入できるとき' do
      it 'すべての情報が入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
      it 'prefectureが1以外なら購入できる' do
        @purchase_address.prefecture_id = 4
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁-4桁でないと購入できない' do
        @purchase_address.post_code = '123-11111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが1なら購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalitiesが空なら購入できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空なら購入できない' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空なら購入できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下なら購入できない' do 
        @purchase_address.telephone = '11111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが12桁以上なら購入できない' do
        @purchase_address.telephone = '090111111112'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが全角数値だと購入できない' do
        @purchase_address.telephone = '０９０１１１１１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'userが紐ついていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐ついていなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end