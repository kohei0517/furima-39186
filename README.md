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
| email              | string | null: false ,unique: true |
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
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer



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