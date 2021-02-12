require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end
  describe "ユーザー新規登録" do
    it "nickname,email,passwordなどが存在すれば登録できること" do
     expect(@user).to be_valid
    end
   it "emailが空だと登録できないこと" do
    @user.email = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it "passwordが空だと登録できないこと" do
    @user.password = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end
   it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
    @user.password_confirmation = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it 'passwordとpassword_confirmation不一致では登録できないこと' do
    @user.password_confirmation = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it "nicknameが空だと登録できないこと" do
    @user.nickname = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end
   it "last_nameが空だと登録できないこと" do
    @user.last_name = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
   end
   it "first_nameが空だと登録できないこと" do
    @user.first_name = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
   end
   it "last_name_kanaが空だと登録できないこと" do
    @user.last_name_kana = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
   end
   it "first_name_kanaが空だと登録できないこと" do
    @user.first_name_kana = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
   end
   it "birth_dayが空だと登録できないこと" do
    @user.birth_day = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth day can't be blank")
   end
 end
end
