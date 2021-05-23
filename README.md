	
# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password-confirmation | string | null: false |
| first-name            | string | null: false |
| last-name             | string | null: false |
| first-name-kana       | string | null: false |
| last-name-kana        | string | null: false |
| birth                 | string | null: false |

### Association

- has_many :items
- has_many :purchaser

##  items テーブル

| Column            | Type       | Options               |
| ----------------- | ------     | --------------------- |
| product-name      | string     | null: false           |
| product-info      | text       | null: false           |　
| category_id       | integer    | null: false           |
| product_condition | integer    | null: false           |
| shipping_charges  | integer    | null: false           |
| shipping_area     | integer    | null: false           |
| day to ship       | integer    | null: false           |
| price             | integer    | null: false           |
| user_id           | references | foreign_key: true     |

### Association

- belongs_to :user
- has_one :purchaser

## purchaser テーブル

| Column   | Type       | Options           |
| ---------| ---------- | ------------------|
| user_id  | references | foreign_key: true |
| item_id  | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column         | Type       
| Options     |
| ---------------| -----------| ------------|
| prefecture     | string     | null: false |                               |
| city           | string     | null: false |
| house_number   | string     | null: false |
| post_code      | string     | null: false |
| phone_number   | string     | null: false |
| purchaser_id   | references | null: false |
### Association

- belongs_to :purchaser 
