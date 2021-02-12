require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    #正常系のテストコード
    it 'nickname,email,passwordなどが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    # Emailの異常系テストコード
    it 'emailが空だと登録できないこと' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@がないと登録できないこと' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    # passwordの異常系テストコード
    it 'passwordが空だと登録できないこと' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下だと登録できないこと' do
      @user.password = '1aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英語のみだと登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordが数字のみだと登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordが全角英数混合だと登録できないこと' do
        @user.password = '１sssss'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
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

    # nicknameの異常系テストコード
    it 'nicknameが空だと登録できないこと' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    # name系の異常テストコード
    #last_name
    it 'last_nameが空だと登録できないこと' do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角以外だと登録できないこと' do
      @user.last_name = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'last_name_kanaが空だと登録できないこと' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが全角カタカナ以外だと登録できないこと' do
      @user.last_name_kana = 'sss'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    #first_name
    it 'first_nameが空だと登録できないこと' do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角以外だと登録できないこと' do
      @user.first_name = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'fast_name_kanaが全角カタカナ以外だと登録できないこと' do
      @user.first_name_kana = 'ttt'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    #birth_day異常系テストコードFirst name kana Full-width katakana characters
    it 'birth_dayが空だと登録できないこと' do
      @user.birth_day = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
