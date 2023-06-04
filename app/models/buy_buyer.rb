class BuyBuyer
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :address, :building, :phone, :user_id, :item_id, :buy_id, :token, :price

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid'}
    validates :city, :address, :token
    validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :user_id, :item_id
  end

  def save
    @item = Item.find(item_id)
    buy = Buy.create(user_id: user_id, item_id: @item.id)
    Buyer.create(zip_code: zip_code, area_id: area_id, city: city, address: address, building: building, phone: phone, buy_id: buy.id)
  end
end