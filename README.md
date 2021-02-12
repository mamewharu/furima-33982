# README

## usersテーブル

|Column|Type|Options|
| ------------------ | ------- | ------------------------ |
| email              | string  | unique: true null: false |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birth_day          | date    | null: false              |


### Association
- has_many :items
- has_many :pays

## itemsテーブル

|Column|Type|Options|
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| text                   | text       | null: false       |
| category_id            | interger   | null: false       |
| state_id               | interger   | null: false       |
| shipping_fee_burden_id | interger   | null: false       |
| area_id                | interger   | null: false       |
| shipping_day_id        | interger   | null: false       |
| price                  | interger   | null: false       |
| user                   | references | foreign_key: true | 


### Association
- belongs_to :user
- has_one :pay

## paysテーブル

|Column|Type|Options|
| -------- | ---------- | ----------------- |
| item     | references | foreign_key: true | 
| user     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street_address

## street_addressesテーブル

|Column|Type|Options|
| -------------- | --------- | ----------------- |
| postalcode     | string    | null: false       |
| area_id        | interger  | null: false       |
| municipalities | string    | null: false       |
| address        | string    | null: false       |
| place          | string    |                   |
| tel            | string    | null: false       |
| pay            | references| foreign_key: true |


### Association
- belongs_to :pay
