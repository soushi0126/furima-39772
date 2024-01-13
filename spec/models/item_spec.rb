require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品入力' do
    context '商品が出品できるとき' do
      it 'すべての情報が入力されていれば正常に出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが300円以上、1000万未満なら出品できる' do
        @item.price = 999_999
        expect(@item).to be_valid
      end

      it 'categoryが1以外なら出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it 'situationが1以外なら出品できる' do
        @item.situation_id = 2
        expect(@item).to be_valid
      end

      it 'delivery_loadが1以外なら出品できる' do
        @item.delivery_load_id = 2
        expect(@item).to be_valid
      end

      it 'prefectureが1以外なら出品できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end

      it 'shipping_dayが1以外なら出品できる' do
        @item.shipping_day_id = 2
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'nameが空欄なら出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空欄なら出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが300未満なら出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが1000万以上なら出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'imageが添付されていないなら出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'categoryが1なら出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'situationが1なら出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation must be other than 1')
      end

      it 'delivery_loadが1なら出品できない' do
        @item.delivery_load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery load must be other than 1')
      end

      it 'prefectureが1なら出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'shipping_dayが1なら出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end

      it 'priceは空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceは整数でなければ出品できない' do
        @item.price = "300.1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end

      it 'userが紐ついていないければ出品できない' do 
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
