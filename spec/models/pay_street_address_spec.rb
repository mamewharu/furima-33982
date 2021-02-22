require 'rails_helper'

RSpec.describe PayStreetAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item  = FactoryBot.create(:item, user_id: user.id) 
    @pay_street_address = FactoryBot.build(:pay_street_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入機能' do
    context '購入がうまくいった時' do
      it '全ての購入情報が正しく入力されていれば保存できること' do
        expect(@pay_street_address).to be_valid
      end

      it 'placeが空でも保存できること' do
        @pay_street_address.place = ''
        expect(@pay_street_address).to be_valid
      end
    end

    context '購入がうまくいかなかった時' do
      # postal_codeの異常テストコード
      it 'postal_codeが空だと購入できないこと' do
        @pay_street_address.postal_code = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角数字で値を入力してないと購入できないこと' do
        @pay_street_address.postal_code = '１２３４-５６７'
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'postal_codeが半角のハイフンを含んだ値を入力してないと購入できないこと' do
        @pay_street_address.postal_code = '1234567'
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include('Postal code Input correctly')
      end

      # 都道府県の異常テストコード
      it 'area_idにて「---」を選択すると購入できないこと' do
        @pay_street_address.area_id = 1
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include('Area select')
      end

      # 市町村の異常テストコード
      it 'municipalitiesが空だと購入できないこと' do
        @pay_street_address.municipalities = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      # 番地の異常テストコード
      it 'addressが空だと購入できないこと' do
        @pay_street_address.address = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("Address can't be blank")
      end

      # telの異常テストコード
      it 'telが空だと購入できないこと' do
        @pay_street_address.tel = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telの値が整数でないと購入できないこと' do
        @pay_street_address.tel = '０９０１２３４５６７'
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include('Tel Input only number')
      end

      it 'telの値が英数混合だと購入できないこと' do
        @pay_street_address.tel = '09012345abc'
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include('Tel Input only number')
      end

      # tokenの異常テストコード
      it 'tokenの情報がないと購入できないこと' do
        @pay_street_address.token = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("Token can't be blank")
      end

      # user_idとitem_idの異常テストコード
      it 'user_idがないと購入できないこと' do
        @pay_street_address.user_id = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと購入できないこと' do
        @pay_street_address.item_id = ''
        @pay_street_address.valid?
        expect(@pay_street_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
