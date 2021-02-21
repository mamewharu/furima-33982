require 'rails_helper'

RSpec.describe PayStreetAddress, type: :model do
  describe '購入情報' do
    before do
      @pay_street_address = FactoryBot.build(:pay_street_address)
    end

    it "全ての購入情報が正しく入力されていれば保存できること" do
      expect(@pay_street_address).to be_valid
    end

    #postal_codeの異常テストコード
    it "postal_codeが空だと保存できないこと" do
      @pay_street_address.postal_code = " "
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeが半角数字で値を入力してないと保存できないこと" do
      @pay_street_address.postal_code = "１２３４-５６７"
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "postal_codeが半角のハイフンを含んだ値を入力してないと保存できないこと" do
      @pay_street_address.postal_code = "1234567"
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    #都道府県の異常テストコード
    it "area_idを選択していないと保存できないこと" do
      @pay_street_address.area_id = ''
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Area select")
    end

    #市町村の異常テストコード
    it "municipalitiesが空だと保存できないこと" do
      @pay_street_address.municipalities = ' '
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Municipalities can't be blank")
    end

    #番地の異常テストコード
    it "addressが空だと保存できないこと" do
      @pay_street_address.address = ''
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Address can't be blank")
    end

    #建物の異常テストコード
    it "placeが空でも保存できること" do
      @pay_street_address.place = ''
      @pay_street_address.valid?
      expect(@pay_street_address).to be_valid
    end

    #telの異常テストコード
    it "telが空だと保存できないこと" do
      @pay_street_address.tel = ''
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Tel can't be blank")
    end

    it "telの値が整数でないと保存できないこと" do
      @pay_street_address.tel = '０９０１２３４５６７'
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Tel Input only number")
    end

    it "tokenの情報がないと保存できないこと" do
      @pay_street_address.token = " "
      @pay_street_address.valid?
      expect(@pay_street_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end
