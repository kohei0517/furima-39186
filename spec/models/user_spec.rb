require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'メールアドレスが必須であること' do
      @user.email =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end
    it 'メールアドレスが一意性であること' do
      @user.save
      adduser = FactoryBot.build(:user)
      adduser.email = @user.email
      adduser.valid?
      expect(adduser.errors.full_messages).to include("Email has already been taken")
    end
    it 'メールアドレスは@を含む必要があること' do
      @user.email ="aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが必須であること' do
      @user.password =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上の入力が必須であること' do
      @user.password ="12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      @user.password_confirmation =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
