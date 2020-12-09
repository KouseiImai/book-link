require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録が上手くいく時' do
      it '新規ユーザー登録に関する全てのデータが存在すれば登録出来る' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字で登録出来る' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'nicknameが空だと登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
        # ニックネームを入力してください
      end
      it 'emailが空だと登録出来ない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
        # Eメールを入力してください
      end
      it '重複したemailが存在する場合は登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        # Eメールはすでに存在します'
      end
      it 'emailは@を含んでいないと登録出来ない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        # Eメールは不正な値です
      end
      it 'パスワードが空だと登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
        # パスワードを入力してください
      end
      it 'パスワードは5文字以下だと登録出来ない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        # パスワードは6文字以上で入力してください
      end
      it 'パスワードは半角英数字混合でないと登録出来ない' do
        @user.password = 'A12345'
        @user.password_confirmation = 'A12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
        # パスワードは不正な値です
      end
      it 'パスワードは確認用を含めて2回入力しないと登録出来ない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        # パスワード（確認用）とパスワードの入力が一致しません
      end
      it '性別項目が空だと登録出来ない' do
        @user.gender_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender can't be blank")
        # 性別を入力してください
      end
      it '年齢項目が空だと登録出来ない' do
        @user.age_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
        # 年齢を入力してください
      end
    end
  end
end
