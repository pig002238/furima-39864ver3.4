# テーブル設計

## users テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| email                      | string | null: false, default|
| encrypted_password         | string | null: false |
| first_name                 | string | null: false |
| last_name                  | string | null: false |
| kana_first_name            | string | null: false |
| kana_last_name             | string | null: false |
| date_of_birth              | date   | null: false |

### Association

- has_many :items
- has_many :delivery_addresses

## items テーブル

| Column                 | Type       | Options                            |
| ---------------------- | ---------- | ---------------------------------- |
| item                   | string     | null: false                        |
| item_description       | text       | null: false                        |
| category_id            | integer    | null: false                        |
| item_condition_id      | string     | null: false                        |
| postage_id             | string     | null: false                        |
| prefecture_id          | string     | null: false                        |
| delivery_time_id       | datetime   | null: false                        |
| price                  | integer    | null: false                        |
| user                   | references | null: false, foreign_key: true     |


### Association

- belongs_to :user
- has_one :purchase_history



## purchase_histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| street_number    | string     | null: false |
| building         | string     |             |
| purchase_history    | string     | null: false |

### Association

- belongs_to :purchase_history