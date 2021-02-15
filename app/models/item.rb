class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :user
  has_one_attached :image

  with_options presence:true do
    validates  :name                       
    validates  :text                      
    validates  :category_id ,  numbericality: { other_than: 1 }
    validates  :state_id                   
    validates  :shipping_fee_burden_id    
    validates  :area_id                
    validates  :shipping_day_id            
    validates  :price
    validates  :image
  end
end
