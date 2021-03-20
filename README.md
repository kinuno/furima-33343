# README

## Users

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false, unique: true |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| last_name           | string     | null: false               |
| first_name          | string     | null: false               |
| last_name_kana      | string     | null: false               |
| first_name_kana     | string     | null: false               |
| birthday            | date       | null: false               |


### Association
- has_many :items
- has_many :orders


## Items

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| fee_id            | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| delivery_days_id  | integer    | null: false                    |
| item_price        | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order


## Orders

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery


## Deliveries

| Column                 | Type       | Options      |
| ---------------------- | ---------- | ------------ |
| delivery_postcode      | string     | null: false  |
| delivery_prefecture_id | integer    | null: false  |
| delivery_city          | string     | null: false  |
| delivery_housenumber   | string     | null: false  |
| delivery_building      | string     |              |
| delivery_telephone     | string     | null: false  |

### Association
- belongs_to :order
