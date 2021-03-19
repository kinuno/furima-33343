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

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_explanation         | text       | null: false                    |
| item_category            | string     | null: false                    |
| item_condition           | string     | null: false                    |
| delivery_fee             | integer    | null: false                    |
| delivery_from_prefecture | string     | null: false                    |
| delivery_days            | string     | null: false                    |
| item_price               | string     | null: false                    |
| user                     | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many   :orders


## Orders


| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_number           | string     | null: false                    |
| card_expiration_year  | integer    | null: false                    |
| card_expiration_month | integer    | null: false                    |
| card_cvc              | string     | null: false                    |
| delivery_postcode     | string     | null: false                    |
| delivery_prefecture   | string     | null: false                    |
| delivery_city         | string     | null: false                    |
| delivery_housenumber  | string     | null: false                    |
| delivery_building     | string     | null: false                    |
| delivery_telephone    | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
