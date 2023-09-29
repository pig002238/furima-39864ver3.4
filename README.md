# テーブル設計

## users テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| encrypted_password         | string | null: false |
| first_name                 | string | null: false |
| last_name                  | string | null: false |
| kana_first_name            | string | null: false |
| kana_last_name             | string | null: false |
| date_of_birth              | date   | null: false |

### Association

- has_many :items
- has_many :delivery addresses

## items テーブル

| Column                 | Type       | Options                            |
| ---------------------- | ---------- | ---------------------------------- |
| image                  | string     | null: false                        |
| item                   | text       | null: false                        |
| item_description       | string     | null: false                        |
| category               | string     | null: false                        |
| item_condition         | string     | null: false                        |
| postage                | string     | null: false                        |
| prefecture_id          | string     | null: false                        |
| delivery_time          | datetime   | null: false                        |
| price                  | float      | null: false                        |
| user_id                | references | null: false, foreign_key: true     |


### Association

- belongs_to :user
- has_one :purchase history



## purchase_history テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_addresses

## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| street_number    | string     | null: false |
| building         | string     |             |
| phone_number     | string     | null: false |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history