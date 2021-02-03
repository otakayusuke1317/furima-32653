## users

|         Column        |  Type  |  Options    |
|-----------------------|--------|-------------|
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birth_day	            | date	 | null: false |

### Association

- has_many  :products
- has_many  :purchase_records

## products

|        Column        |   Type   |  Options    |
|----------------------|----------|-------------|
| name                 | string   | null: false |
| price                | integer  | null: false |
| description          | text     | null: false |
| status_id            | integer  | null: false |
| shipping_cost_id     | integer  | null: false |
| shipping_day_id      | integer  | null: false |
| prefecture_id        | integer  | null: false |
| category_id          | integer  | null: false |
| user_id              | integer  | null: false, foreign_key: true|

### Association

- has_one :purchase_record, dependent: :destroy
- belongs_to :user

## destinations

|      Column       |   Type  |  Options    |
|-------------------|---------|-------------|
| post_code         | string  | null: false |
| prefecture_id     | integer | null: false |
| city              | string  | null: false |
| address           | string  | null: false |
| building_name     | string  |
| phone_number      | string  | null: false |
| purchase_record_id| integer | null: false, foreign_key: true|

### Association

- belongs_to :purchase_record

## purchase_record

|      Column      |  Type  |  Options    |
|------------------|--------|-------------|
| product_id       | integer| null: false, foreign_key: true|
| user_id          | integer| null: false, foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user
- has_one :destination