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
| b_day     | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| p_name   | string     | null: false                    |
| p_info   | text       | null: false                    |
| ctg_id   | integer    | null: false                    |
| status_id| integer    | null: false                    |
| de_fee_id| integer    | null: false                    |
| de_are_id| integer    | null: false                    |
| de_day_id| integer    | null: false                    |
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

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| order   | references | null: false, foreign_key: true |
| post    | string     | null: false                    |
| pref_id | integer    | null: false                    |
| city    | string     | null: false                    |
| area    | string     | null: false                    |
| bld     | string     |                                |
| phone   | string     | null: false                    |

### Association

- belongs_to :order
