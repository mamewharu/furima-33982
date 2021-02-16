class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :state_genre
  belongs_to :shipping_fee_burden_genre
  belongs_to :area_genre
  belongs_to :shipping_day_genre
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates  :name, length: { maximum: 40 }
    validates  :text, length: { maximum: 10_000 }
    validates  :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates  :price,
               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates  :image
   with_options  numericality: {other_than: 1, message: 'Select'} do
     validates  :category_id
     validates  :state_id
     validates  :shipping_fee_burden_id
     validates  :area_id
     validates  :shipping_day_id
    end
  end
end

