# README


* ...
機能：
ユーザー登録
商品登録
商品購入
* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options     |validate|
| ------------------ | ------ | ----------- |--------|
| email              | string | null: false |UNIQUE  |
| encrypted_password | string | null: false |        |
| nickname           | string | null: false |        |
| name               | string | null: false |        |
| F_name             | string | null: false |        |
| name_kana         | string | null: false |        |
| F_name_kana        | string | null: false |        |
| birthday_y         | string | null: false |        |
| birthday_m         | string | null: false |        |
| birthday_d         | string | null: false |        |



### Association

- has_many :items

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category    | text       | null: false                    |
| state       | string     | null: false                    |
| how_match   | string     | null: false                    |
| where       | string     | null: false                    |
| while       | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## buy テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| cardnum   | text       |                                |
| until     | string     |                                |
| s_code    | integer    |                                |

### Association

- has_one :buyer

## buyer テーブル
| Column     | Type    | Options                   |
| ---------- | ------- | ------------------------- |
| zip_code   | string  | null: false               |
| prefecture | string  | null: false               |
| city       | string  | null: false               |
| address    | string  | null: false               |
| building   | string  |                           |
| phone      | integer | null: false               |
| buy        | references | null: false, foreign_key: true |


### Association

- belongs_to :buy

* ...