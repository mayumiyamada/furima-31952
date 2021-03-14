require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
     before do
      @order_address = FactoryBot.build(:order_address)    
    end

  describe '商品購入住所の保存' do 
    context '保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      
      it 'postal_codeはハイフンありだと保存できること' do
        @order_address.postal_code = '123-0046'
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      
      it 'phone_numberは11桁以下だと保存できること' do
        @order_address.phone_number = '0123456789'
        expect(@order_address).to be_valid
      end

      it 'phone_numberはハイフンなしだと保存できる' do
        @order_address.phone_number = '0312345678'
        expect(@order_address).to be_valid
      end
    end
    context '保存できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Postal code can't be blank")
      end
      
      it 'postal_codeはハイフンなしだと保存できないこと' do
        @order_address.postal_code = '1230046'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefectureが空だと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Prefecture Select")
      end

      it 'prefectureの選択が０だと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Prefecture Select")
      end

      it 'cityは空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("City can't be blank")
      end

      it 'addressは空では保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Phone number can't be blank")
      end

      it 'phone_numberは11桁以上だと保存できないこと' do
        @order_address.phone_number = '12345678922233'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Phone number No hyphen(-)& less than 11")
      end
        
      it 'phone_numberはハイフンありだと保存できないこと' do
        @order_address.phone_number = '03-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include ("Phone number No hyphen(-)& less than 11")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      

  end
 end
end