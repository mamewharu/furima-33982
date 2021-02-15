require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品投稿機能'
  #正常系のテストコード
  it '画像、商品名、説明、各ジャンル、値段があれば登録できること' do
    expect(@item).to be_valid
  end

  #商品名の異常系のテストコード
  it '商品名がないと登録できないこと' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  #説明の異常系テストコード
  it '説明文がないと登録できないこと' do
    @item.text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end
   #カテゴリーの異常系テストコード
   it 'カテゴリーの選択がないと登録できないこと' do
    @item.category_id  = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
   #商品状態の異常系テストコード
   it '商品状態の選択がないと登録できないこと' do
    @item.state_id  = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("State can't be blank")
  end
   #配送料負担の異常系テストコード
   it '配送料負担の選択がないと登録できないこと' do
    @item.shipping_fee_burden_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
  end
  #発送元の地域の異常系テストコード
  it '発送元の地域の選択がないと登録できないこと' do
    @item.area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Area can't be blank")
  end
  #発送までの日数の異常系テストコード
  it '発送までの日数の選択がないと登録できないこと' do
    @item.shipping_day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
  end
  #販売価格の異常系テストコード
  it '販売価格の入力がないと登録できないこと' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it '販売価格は半角数字でないと登録できないこと' do
    @item.price = '１００００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Half-width number")
  end
  it '300円以下だとと登録できないこと' do
    @item.price = '299'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end
  it '9999999円以上だとと登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
  end
  #商品画像の異常系テストコード
  it '商品画像がないと登録できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
end
