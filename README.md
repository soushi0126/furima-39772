# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| fast_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| fast_name_kana     | string | null: false               |
| date_of_birth      | date   | null: false               |


### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| situation_id     | integer    | null: false                    |
| delivery_load_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- has_many :comments
- has_one :address
- belongs_to :user
- belongs_to :item

## comments テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| purchase | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## addresses テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase