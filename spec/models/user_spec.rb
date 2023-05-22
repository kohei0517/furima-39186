require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録が出来る時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
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
      it 'パスワードは129文字以上の入力が必須であること' do
        @user.password = 10**129
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password_confirmation =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "nicknameが空では登録できない" do
        @user.nickname =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "nameが空では登録できない" do
        @user.name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "f_nameが空では登録できない" do
        @user.f_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name can't be blank")
      end
      it "name_kanaが空では登録できない" do
        @user.name_kana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it "f_name_kanaが空では登録できない" do
        @user.f_name_kana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana can't be blank")
      end
    end
  end
end
