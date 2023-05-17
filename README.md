# README


* ...
機能：
ユーザー登録
商品登録
商品購入
* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false ,UNIQUE: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| name               | string | null: false               |
| f_name             | string | null: false               |
| name_kana          | string | null: false               |
| f_name_kana        | string | null: false               |
| birthday           | date   | null: false               |



### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| payed_id    | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| progress_id | integer    | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| cardnum   | text       |                                |
| until     | string     |                                |
| s_code    | integer    |                                |
| user      | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user


## buyers テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zip_code   | string     | null: false                    |
| area_id    | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
| buy        | references | null: false, foreign_key: true |


### Association

- belongs_to :buy

* ...