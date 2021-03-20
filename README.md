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
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| fee_id            | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| delivery_days_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| housenumber   | string     | null: false                    |
| building      | string     |                                |
| telephone     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
