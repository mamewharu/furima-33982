class PayStreetadress
  include ActiveModel::Model
  atter_accessor :postal_code, :area_id, :municipalities, :address, :tel, :pay_id, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :tel
    validates :pay_id
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    pay = Pay.create(item: item_id, user: user_id)

    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, tel: tel, pay_id: pay.id)
  end
end