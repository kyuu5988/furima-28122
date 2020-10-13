# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| last_name | string | null: false |
| first_name| string | null: false |
| last_kana | string | null: false |
| first_kana| string | null: false |
| b_day     | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| p_name   | string     | null: false                    |
| p_info   | text       | null: false                    |
| ctg      | string     | null: false                    |
| status   | string     | null: false                    |
| deli_fee | boolean    | null: false                    |
| deli_area| string     | null: false                    |
| deli_days| string     | null: false                    |
| price    | integer    | null: false                    |
| sold     | boolean    | null: false                    |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| card_no | string     | null: false                    |
| card_mm | string     | null: false                    |
| card_yy | string     | null: false                    |
| card_cvc| string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| order   | references | null: false, foreign_key: true |
| post    | string     | null: false                    |
| pref    | string     | null: false                    |
| city    | string     | null: false                    |
| area_id | integer    | null: false                    |
| bld     | string     |                                |
| phone   | string     | null: false                    |

### Association

- belongs_to :order
