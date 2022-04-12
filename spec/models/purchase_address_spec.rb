require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入' do
    context '新規登録できるとき' do
      it 'post_number,pref_id,city,mail,tell,tokenが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildは空でも登録できる' do
        @purchase_address.build = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'post_numberが空では登録できない' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank", "Post number is invalid")
      end
      it 'cityが空では登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'mailが空では登録できない' do
        @purchase_address.mail = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Mail can't be blank")
      end
      it 'pref_idが未選択の場合は登録できない' do
        @purchase_address.pref_id = '1'
        @purchase_address.valid?
        
        expect(@purchase_address.errors.full_messages).to include("Pref must be other than 1")
      end
      it 'tellが空では登録できない' do
        @purchase_address.tell = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell can't be blank")
      end
      it 'post_numberが3桁-4桁の形でなければ登録できない' do
        @purchase_address.post_number = '111-111'
        @purchase_address.valid?
        
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'post_numberが半角ハイフンを含む形でなければ購入できない' do
        @purchase_address.post_number = '1111111'
        @purchase_address.valid?
        
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'tellに半角数字以外が含まれている場合登録できないこと' do
        @purchase_address.tell = '080123４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'tellが10桁以内では登録できない' do
        @purchase_address.tell = '080123457'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'tellが12桁以上では登録できない' do
        @purchase_address.tell = '080123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end

