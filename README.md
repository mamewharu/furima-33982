# README

## userテーブル

|Column|Type|Options|
| -------------- | ------- | -------- |
| email          | string  | NOT NULL |
| password       | string  | NOT NULL |
| nickname       | string  | NOT NULL |
| lastname       | string  | NOT NULL |
| firstname      | string  | NOT NULL |
| lastname kana  | string  | NOT NULL |
| firstname kana | string  | NOT NULL |
| baith year     | integer | NOT NULL |


### Association
- has_many :items

## itemテーブル

|Column|Type|Options|
| ---------- | ---------- | -------- |
| item_name  | string     | NOT NULL |
| text       | text       | NOT NULL |
| user       | references |          |


### Association
- belongs :user
- has_one :pay

## payテーブル

|Column|Type|Options|
| -------- | ---------- | -------- |
| item     | references |          |
| user     | references |          |

### Association
- belongs :item
- has_one :street address

## street addressテーブル

|Column|Type|Options|
| -------------- | -------- | -------- |
| postalcode     | interger | NOT NULL |
| prefectures    | string   | NOT NULL |
| municipalities | string   | NOT NULL |
| address        | string   | NOT NULL |
| place          | string   | NOT NULL |
| TEL            | interger | NOT NULL |


### Association
- belongs :pay
