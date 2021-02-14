class Item < ApplicationRecord
  belongs_to :user

  with_options presence:true do
    validates  :name                       
    validates  :text                      
    validates  :category_id                
    validates  :state_id                   
    validates  :shipping_fee_burden_id    
    validates  :area_id                
    validates  :shipping_day_id            
    validates  :price
  end
end
