require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品出品機能' do
    before do

      @item = FactoryBot.build(:item)

    end
  
    context '出品できるとき' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
  
    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end
  
      it 'nameが空では出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")

      end
  
      it 'descriptionが空では出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")

      end
  
      it 'category_idが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")

      end
  
      it 'condition_idが空では出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
  
      it 'shipping_fee_idが空では出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    
      end
  
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    
      end
  
      it 'delivery_time_idが空では出品できない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
    
      end
  
      it 'priceが空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
    
      end
  
      it 'priceが300未満では出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price :価格は、¥300~¥9,999,999の間で指定してください")
    
      end
  
      it 'priceが9,999,999より大きいと出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price :価格は、¥300~¥9,999,999の間で指定してください")
    
      end
  
      it 'priceが半角数字でないと出品できない（全角数字）' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price :価格は、¥300~¥9,999,999の間で指定してください")
        .or include("Price :半角数字で入力してください")
      end
  
      it 'priceが半角数字でないと出品できない（文字混じり）' do
        @item.price = "111あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price :価格は、¥300~¥9,999,999の間で指定してください")
        .or include("Price :半角数字で入力してください")
      end
  
      it 'category_idが1では出品できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
    
      end
  
      it 'condition_idが1では出品できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
    
      end
  
      it 'shipping_fee_idが1では出品できない' do
        @item.shipping_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    
      end
  
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    
      end
  
      it 'delivery_time_idが1では出品できない' do
        @item.delivery_time_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
    
      end
  
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
    
      end
    end
  end
  




end
  