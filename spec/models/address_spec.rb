require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入' do
    context '新規登録できるとき' do
      it 'post_number,pref_id,city,mail,tellが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'post_numberが空では登録できない' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        binding.pry
        expect(@purchase_address.errors.full_messages).to include("")
      end
      it 'cityが空では登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("")
      end
      it 'mailが空では登録できない' do
        @purchase_address.message = ''
        @purchase_address.valid?
        expect(purchase_address.errors.full_messages).to include("")
      end
      it 'pref_idが未選択の場合は登録できない' do
        @purchase_address.pref_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('')
      end
      it 'tellが空では登録できない' do
        @purchase_address.tell = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('')
      end
      it 'post_numberが3桁-4桁の形でなければ登録できない' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("")
      end
      it 'tellが10桁以内では登録できない' do
        @purchase_address.tell = '0801234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('')
      end
      it 'tellが12桁以上では登録できない' do
        @purchase_address.tell = '080123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('')
      end
    end
  end
end
