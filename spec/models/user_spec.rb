require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      # 新規登録/ユーザー情報
      it 'nicknameが空では登録できない' do
        @user.nickname=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 130, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = 'a54321'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password を入力してください")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password を入力してください")
      end
      it '全角を含むパスワードでは登録できない' do
        @user.password = '12345A'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password を入力してください")
      end

      # 新規登録/本人情報確認
      it 'first_nameが空では登録できない' do
        @user.first_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが空ローマ字では登録できない' do
        @user.first_name='Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name を入力してください")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが空ローマ字では登録できない' do
        @user.last_name='Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name を入力してください")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana=''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana を入力してください")
      end
      it 'first_name_kanaがローマ字では登録できない' do
        @user.first_name_kana = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana を入力してください")
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana を入力してください")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana を入力してください")
      end
      it 'last_name_kanaがローマ字では登録できない' do
        @user.last_name_kana = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana を入力してください")
      end
      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana を入力してください")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
