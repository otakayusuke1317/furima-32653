## users

|      Column      |  Type  |  Options    |
|------------------|--------|-------------|
| nickname         | string | null: false |
| email            | string | null: false |
| user_password    | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day	       | date	  | null: false |
| user_image       | string 
| introduction     | text 

### Association

- has_one　 :destination
- has_many  :product

## product

|      Column      |  Type  |  Options    |
|------------------|--------|-------------|
| name             | string | null: false |
| price            | string | null: false |
| description      | string | null: false |
| status           | string | null: false |
| size             | string | null: false |
| shipping_cost    | string | null: false |
| shipping_days    | string | null: false |
| prefecture_id    | string | null: false |
| judgment         | string |
| category_id      | integer| null: false, foreign_key: true|
| brand_id         | integer| null: false, foreign_key: true|
| shipping_id      | integer| null: false, foreign_key: true|
| user_id          | integer| null: false, foreign_key: true|

### Association

- has_many :purchase record
- belongs_to :user destination :destroy

## destination

|      Column      |  Type  |  Options    |
|------------------|--------|-------------|
| user_id          | integer| null: false, foreign_key: true|
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kane  | string | null: false |
| post_code        | string | null: false |
| prefecture       | string | null: false |
| city             | string | null: false |
| address          | string | null: false |
| building_name    | string |
| phone_number     | string |

### Association

- belongs_to :user

## purchase record

|      Column      |  Type  |  Options    |
|------------------|--------|-------------|
| product_id       | integer| null: false, foreign_key: true|
| purchase_id      | integer| null: false, foreign_key: true|
| image            | string | null: false |

### Association

- belongs_to :product