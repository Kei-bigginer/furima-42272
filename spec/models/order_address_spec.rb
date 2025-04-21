require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end



  describe '配送先情報の保存' do
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
      end

      it '郵便番号にハイフンが含まれていないと保存できない' do
      end

      it '都道府県が未選択（idが1）だと保存できない' do
      end

      it '市区町村が空では保存できない' do
      end

      it '番地が空では保存できない' do
      end

      it '電話番号が空では保存できない' do
      end

      it '電話番号が9桁以下では保存できない' do
      end

      it '電話番号が12桁以上では保存できない' do
      end

      it '電話番号にハイフンが含まれていると保存できない' do
      end

      it '電話番号に全角数字が含まれていると保存できない' do
      end
    end
  end
end
