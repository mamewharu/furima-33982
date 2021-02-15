class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :state_genre
  belongs_to :shipping_fee_burden_genre
  belongs_to :area_genre
  belongs_to :shipping_day_genre
  belongs_to :user
  has_one_attached :image

  with_options presence:true do
    validates  :name, length: {maximum: 40}
    validates  :text, length: {maximum: 10000} 
    validates  :category_id ,  numericality: { other_than: 1 }
    validates  :state_id, numericality: { other_than: 1 } 
    validates  :shipping_fee_burden_id, numericality: { other_than: 1 }
    validates  :area_id, numericality: { other_than: 1 }
    validates  :shipping_day_id, numericality: { other_than: 1 } 
    validates  :price, numericality: {with: /\A[0-9]+\z/, message:"Half-width number"}
    validates  :image
  end
end
