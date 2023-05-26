require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録出来る時' do
      it '全ての情報が揃えば登録出来る' do
        expect(@item).to be_valid
      end
    end

    context '商品登録出来ない時' do
      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end
      it '商品名が必須であること' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品名が40文字以内であること' do
        @item.title = 10**41
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it '商品の説明が必須であること' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品の説明が1000文字以下であること' do
        @item.description = 10**1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it 'カテゴリーのIDが2以上が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態のIDが2以上が必須であること' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担のIDが2以上が必須であること' do        
        @item.payed_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payed can't be blank")
      end
      it '発送元の地域のIDが2以上が必須であること' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "発送までの日数のIDが2以上が必須であること" do
        @item.progress_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Progress can't be blank")
      end
      it "価格が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が299以下では不可能である事" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が10000000以上では不可能であること" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が半角数字である事" do
        @item.price = "あいうえお"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザーが必須であること" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
