# テーブル設計

## users テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| email                      | string | null: false |
| password                   | string | null: false |
| name                       | string | null: false |
| phonetic reading of name   | string | null: false |
| date of birth              | string | null: false |

### Association

- has_many :items
- has_many :delivery address

## items テーブル

| Column                 | Type   | Options                            |
| ---------------------- | ------ | ---------------------------------- |
| image                  | string | null: false                        |
| item                   | string | null: false                        |
| item description       | string | null: false                        |
| category               | string | null: false                        |
| item condition         | string | null: false                        |
| postage                | string | null: false                        |
| address                | string | null: false                        |
| delivery time          | string | null: false                        |
| price                  | string | null: false                        |
| user_id                | references | null: false, foreign_key: true |


### Association

- has_many :delivery address
- 



## purchase history テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| card details  | string     | null: false                    |
| expiration date | string     | null: false                    |
| security code  | string     | null: false                    |
| postal code    | string | null: false |
| prefecture    |string| null: false |
| city   | string | null: false |
| number    | string | null: false |
| building    | string | null: false |
| phone number    | string | null: false |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery address

## delivery address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| payment information | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase history