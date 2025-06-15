require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.id = 1
    item = FactoryBot.build(:item)
    item.id = 1
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品を購入できる場合' do
      it '商品を購入できる(建物名あり)' do
        expect(@record_address).to be_valid
      end
      it '商品を購入できる(建物名なし)' do
        @record_address.building = nil
        expect(@record_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it '郵便番号が入力されていない場合は購入できない' do
        @record_address.post_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列で入力されていない場合は購入できない' do
        @record_address.post_number = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post number is invalid")
      end
      it '都道府県が選択されていない場合は購入できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が入力されていない場合は購入できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていない場合は購入できない' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が入力されていない場合は購入できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '10桁以上11桁以内の半角数値で入力されていない場合は購入できない' do
        @record_address.phone_number = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid. Input only numbers.")
      end
    end
  end
end