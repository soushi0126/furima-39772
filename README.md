# テーブル設計

## users テーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false  unique: true             |
| email              | string   | null: false, unique: true |
| password           | string   | null: false               |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| fast_name          | string   | null: false               |
| last_name_kana     | string   | null: false               |
| fast_name_kana     | string   | null: false               |
| date_of_birth      | datetime | null: false               |


### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| situation     | string     | null: false                    |
| delivery_load | integer    | null: false                    |
| region        | string     | null: false                    |
| shipping_day  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

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
- has_many :addresses
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
| post_code      | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| street_address | integer    | null: false                    |
| building       | string     |                                |
| telephone      | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase