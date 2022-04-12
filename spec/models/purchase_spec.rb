require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入' do
    context '新規登録できるとき' do
      it 'tokenが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("")
      end
    end
  end
end
