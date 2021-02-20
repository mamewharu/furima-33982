class PayStreetAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :place, :tel, :pay_id, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Half-width number' }
    validates :municipalities
    validates :address
    validates :tel, numericality: {only_integer: true, message:"Input only number"}
  end
  validates :area_id, numericality: {other_than: 1, message: "select"}

  def save
    
    pay = Pay.create(item_id: item_id, user_id: user_id)

    StreetAddress.create( postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, place: place, tel: tel, pay_id: pay.id )
  end
end