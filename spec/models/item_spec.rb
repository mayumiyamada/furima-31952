require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '出品画像、商品名、商品の説明、カテゴリーの選択、商品状態の選択、配送料の負担の選択、発送元地域の選択、発送までの日数の選択、価格を入力すれば出品できる' do
        expect(@item).to be_valid
      end

      it '商品画像があれば出品できる' do
        expect(@item).to be_valid
      end

      it '価格の範囲が、¥300以上であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it '価格の範囲が、¥9,999,999以下であれば出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空だと出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーの情報の選択が空だと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'カテゴリーの情報の選択が１だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品状態の選択が空だと保存できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status Select')
      end

      it '商品状態の選択が0だと保存できない' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status Select')
      end

      it '配送料の負担の選択が空だと保存できない' do
        @item.shopping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping fee status Select')
      end

      it '配送料の負担の選択が0だと保存できない' do
        @item.shopping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping fee status Select')
      end

      it '発送元の地域の選択が空だと保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it '発送元の地域の選択が0だと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it '発送までの日数の選択が空だと保存できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery Select')
      end

      it '発送までの日数の選択が0だと保存できない' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery Select')
      end

      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は半角数字のみでないと保存できない' do
        @item.price = '５，０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '299円以下では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '10000000円以上では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
