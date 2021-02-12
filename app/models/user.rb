class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence:true do
           validates :nickname
           validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, messasge:"Last name Full-width characters"}
           validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, messasge:"First name Full-width characters"}
           validates :last_name_kana, format: {with: /\A[ァ-ヶ]+\z/, messasge:"Last name kana Full-width katakana characters"}
           validates :first_name_kana, format: {with: /\A[ァ-ヶ]+\z/, messasge:"Last name kana Full-width katakana characters"}
           validates :birth_day
         end
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers" 
end
