require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '購入記録を保存できる' do
      it 'すべての情報がそろっていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名が空欄でも保存できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入記録を保存できない' do
      it '郵便番号が空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に「-」が含まれていないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号の桁数に誤りがあると保存できない' do
        @purchase_address.postal_code = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号に半角数字以外が含まれていると保存できない' do
        @purchase_address.postal_code = '１２３-4567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が「---」だと保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できない' do
        @purchase_address.district = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("District can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと保存できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと保存できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が全角数字が含まれていると保存できない' do
        @purchase_address.phone_number = '０１２０111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号に記号が含まれていると保存できない' do
        @purchase_address.phone_number = '090-1111-2222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'itemが紐づいていない場合は保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐づいていない場合は保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空の場合は保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
