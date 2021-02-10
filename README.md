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
| baith_day         | date    | null: false  |


### Association
- has_many :items
- has/many :pay

## itemsテーブル

|Column|Type|Options|
| ------------------- | ---------- | ----------------- |
| item_name           | string     | null: false       |
| text                | text       | null: false       |
| category            | string     | null: false       |
| state               | string     | null: false       |
| shipping_fee_burden | string     | null: false       |
| area                | string     | null: false       |
| shipping_day        | string     | null: false       |
| price               | interger   | null: false       |
| user                | references | foreign_key: true | 


### Association
- belongs_to :user
- has_one :pays

## paysテーブル

|Column|Type|Options|
| -------- | ---------- | ----------------- |
| item     | references | foreign_key: true |
| user     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street address

## street addressテーブル

|Column|Type|Options|
| -------------- | --------- | ----------------- |
| postalcode     | string    | null: false       |
| prefectures    | string    | null: false       |
| municipalities | string    | null: false       |
| address        | string    | null: false       |
| place          | string    |                   |
| tel            | interger  | null: false       |
| pay            | references| foreign_key: true |


### Association
- belongs_to :pay
