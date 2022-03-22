require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとimage,category_id、quality_id、delivery_charge_id、pref_id、shipping_date_id、fee、messageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @item.nickname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'messageが空では登録できない' do
        @item.message = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Message can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'quality_idが空では登録できない' do
        @item.quality_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality is not a number")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it 'pref_idが空では登録できない' do
        @item.pref_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref is not a number",)
      end
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end
      it 'feeが空では登録できない' do
        @item.fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'feeが¥300より少ない時は登録できないこと' do
        @item.fee = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be greater than or equal to 300')
      end
      it 'feeが¥9999999より大きい時は登録できないこと' do
        @item.fee = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be less than or equal to 9999999')
      end
      it 'feeが半角数字でなければ登録できないこと' do
        @item.fee = 'あｱ３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee is not a number")
      end
    end
  end
end
