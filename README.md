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

- has_one　 :destination
- has_many  :product
- has_many  :purchase record

## products

|      Column      |   Type   |  Options    |
|------------------|----------|-------------|
| name             | string   | null: false |
| price            | integer  | null: false |
| description      | text     | null: false |
| status           | string   | null: false |
| size             | string   | null: false |
| shipping_cost    | string   | null: false |
| shipping_days    | string   | null: false |
| prefecture_id    | string   | null: false |
| judgment         | string   |
| category_id      | integer  | null: false, foreign_key: true|
| brand_id         | integer  | null: false, foreign_key: true|
| shipping_id      | integer  | null: false, foreign_key: true|
| user_id          | integer  | null: false, foreign_key: true|

### Association

- has_many :purchase record
- belongs_to :purchase record destination :destroy

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

- has_one :purchase record

## purchase_record

|      Column      |  Type  |  Options    |
|------------------|--------|-------------|
| product_id       | integer| null: false, foreign_key: true|
| user_id          | integer| null: false, foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user
- has_one :destinations