	
# テーブル設計

## users テーブル

| Column                | Type   | Options     　　　　　　　　|
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_name_kana       | string | null: false               |
| last_name_kana        | string | null: false               |
| birth                 | date   | null: false               |

### Association

- has_many :items

- has_many :purchasers

##  items テーブル

| Column               | Type       | Options               |
| -------------------- | ------     | --------------------- |
| product＿name        | string     | null: false           |
| product＿info        | text       | null: false           |　
| category_id          | integer    | null: false           |
| product_condition_id | integer    | null: false           |
| shipping_charge_id  | integer    | null: false           |
| prefecture_id        | integer    | null: false           |
| day_to_ship_id       | integer    | null: false           |
| price                | integer    | null: false           |
| user           　　   | references | foreign_key: true     |

### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル

| Column   | Type       | Options           |
| ---------| ---------- | ------------------|
| user　　　| references | foreign_key: true |
| item　　　| references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## addresses テーブル

| Column         | Type       | Options     |
| ---------------| -----------| ------------|
| prefecture_id  | integer    | null: false |                               |
| city           | string     | null: false |
| house_number   | string     | null: false |
| post_code      | string     | null: false |
| building_name  | string     |             |
| phone_number   | string     | null: false |
| purchaser_id　　| references | null: false |
### Association

- belongs_to :purchaser 
