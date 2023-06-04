require 'rails_helper'

RSpec.describe BuyBuyer, type: :model do
  before do
    item = FactoryBot.create(:item)
    @buy_buyer = FactoryBot.build(:buy_buyer, user_id: item.user_id, item_id: item.id)
    sleep(0.1)
  end


  describe '商品購入' do
    context '内容に問題ない場合' do
      it "内容が正しければ保存ができること" do
        expect(@buy_buyer).to be_valid
      end
      it "buildingがなくても内容が正しければ保存ができること" do
        @buy_buyer.building = ""
        expect(@buy_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "トークン情報がなければ保存ができないこと" do
        @buy_buyer.token = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号なければ保存ができないこと" do
        @buy_buyer.zip_code = ""
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it "郵便番号にハイフンがなければ保存ができないこと" do
        @buy_buyer.zip_code = "1234567"
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it "郵便番号は3文字-4文字でなければ保存ができないこと" do
        @buy_buyer.zip_code = "1234-567"
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it "都道府県が1では保存出来ない" do
        @buy_buyer.area_id = "1"
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Area can't be blank")
      end
      it "市区町村が無いと保存出来ない" do
        @buy_buyer.city = ""
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("City can't be blank",)
      end
      it "番地が無いと保存出来ない" do
        @buy_buyer.address = ""
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が無いと保存出来ない" do
        @buy_buyer.phone = ""
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Phone can't be blank")
      end
      it "電話番号が9桁以下だと保存出来ない" do
        @buy_buyer.phone = "12345678"
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Phone is invalid")
      end
      it "電話番号が12桁以上では購入できない" do
        @buy_buyer.phone = "123456789012"
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Phone is invalid")
      end
      it "電話番号に半角数字以外が含まれている場合は購入できない" do
        @buy_buyer.phone = "A1234567890"
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Phone is invalid")
      end
        it "ユーザーがいないと保存出来ない" do
        @buy_buyer.user_id = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("User can't be blank")
      end
      it "アイテムがいないと保存出来ない" do
        @buy_buyer.item_id = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
