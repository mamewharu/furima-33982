class PayStreetAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :place, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :municipalities
    validates :address
    validates :tel, numericality: { only_integer: true, message: 'Input only number' }
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1, message: 'select' }

  def save
    pay = Pay.create(item_id: item_id, user_id: user_id)

    StreetAddress.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address,
                         place: place, tel: tel)
  end
end
