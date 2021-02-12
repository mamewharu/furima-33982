FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    nickname              {'test'}
    last_name             {'田中'}
    first_name           {'太郎'}
    last_name_kana       {'タナカ'}
    first_name_kana      {'タロウ'}
    birth_day            {'2000/1/1'}
  end
end