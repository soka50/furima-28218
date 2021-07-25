require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '出品ページへ遷移できること' do
      it 'ログインしているユーザーだけが、出品ページへ遷移できること' do
        expect(@item).to be_valid
      end

      context '出品ページへ遷移できないこと' do
        it '画像は1枚必須であること(ActiveStorageを使用すること)' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が必須であること' do
          @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end

        it '商品の説明が必須であること' do
          @item.product_info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product info can't be blank")
        end

        it 'カテゴリーの情報が必須であること' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end

        it ' 商品の状態についての情報が必須であること' do
          @item.product_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Product condition Select')
        end

        it '配送料の負担についての情報が必須であること' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge Select')
        end

        it '発送元の地域についての情報が必須であること' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end

        it '発送までの日数についての情報が必須であること' do
          @item.day_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Day to ship Select')
        end

        it '価格についての情報が必須であること' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格の範囲が、¥299以下では入力できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 299')
        end

        it '価格の範囲が、¥10,000,000以下であること' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than 10000000')
        end

        it '販売価格は半角数字のみ保存可能であること(全角) ' do
          @item.price = '１２３４５'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it '販売価格は半角数字のみ保存可能であること(半角英字) ' do
          @item.price = 'abc'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it '販売価格は半角数字のみ保存可能であること(半角英字数字) ' do
          @item.price = 'abc123'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it 'ユーザーが紐付いていなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
