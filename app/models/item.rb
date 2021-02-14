class Item < ApplicationRecord
  with_options presence:true do
    validates  :name                       
    validates  :text                      
    validates  :category_id                
    validates  :state_id                   
    validates  :shipping_fee_burden_id    
    validates  :area_id                
    validates  :shipping_day_id            
    validates  :price, between: {300,9999999} 
    validates  :image
  end

  belongs_to :user
end
