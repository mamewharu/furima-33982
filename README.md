# README

## usersテーブル

|Column|Type|Options|
| ----------------- | ------- | ------------ |
| email             | string  | unique: ture |
| encryped_password | string  | null: false  |
| nickname          | string  | null: false  |
| last_name         | string  | null: false  |
| first_name        | string  | null: false  |
| lastname_kana     | string  | null: false  |
| firstname_kana    | string  | null: false  |
| baith_year        | integer | null: false  |


### Association
- has_many :items
- belongs_to :pay

## itemsテーブル

|Column|Type|Options|
| ---------- | ---------- | ----------- |
| item_name  | string     | null: false |
| text       | text       | null: false |
| price      | interger   | null: false |
| user       | references |             | 


### Association
- belongs_to :user
- has_one :pays

## paysテーブル

|Column|Type|Options|
| -------- | ---------- | -------- |
| item     | references |          |
| user     | references |          |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street address

## street addressテーブル

|Column|Type|Options|
| -------------- | --------- | ----------- |
| postalcode     | string    | null: false |
| prefectures    | string    | null: false |
| municipalities | string    | null: false |
| address        | string    | null: false |
| place          | string    |             |
| tel            | interger  | null: false |
| pay            | references|             |


### Association
- belongs_to :pay
