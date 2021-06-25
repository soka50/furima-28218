require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it '生年月日が必須であること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid',
                                                      "Password confirmation doesn't match Password")
      end

      it 'パスワードは6文字以上であること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角英語のみのときに登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角数字のみのときに登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end

      it 'ユーザー本名は、名前が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end

      it 'ユーザー本名の名字は、フリガナが必須であること' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角文字を使用してください')
      end

      it 'ユーザー本名の名前は、フリガナが必須であること' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角文字を使用してください')
      end

      it 'ユーザー本名の名字は、フリガナは全角（カタカナ）で入力させること' do
        @user.first_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角文字を使用してください')
      end

      it 'ユーザー本名の名前は、フリガナは全角（カタカナ）で入力させること' do
        @user.last_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角文字を使用してください')
      end
    end
  end
end
