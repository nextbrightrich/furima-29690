# README
# テーブル設計

## users テーブル
| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false
| email          | string | null: false |
| password       | string | null: false |
| password_again | string | null: false |
| firstname      | string | null: false |
| familyname     | string | null: false |
| firstnamekana  | string | null: false |
| familynamekana | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :items
- has_many :custmors

##  items テーブル
| Column             | Type      | Options     |
| --------           | ------    | ----------- |
| name               | string    | null: false |
| description        | text      | null: false |
| price              | integer   | null: false |
| category＿id      | integer   | null: false |
| status_id          | integer   | null: false |
| burden_id          | integer   | null: false |
| area_id            | integer   | null: false |
| days_id            | integer   | null: false |
| user               | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :custmor

## custmers テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| user_id            | references| null: false, foreign_key: true |
| item_id            | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has many : custmors
- has one : address

## addresses  テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| postalcode         | integer| null: false|
| area_id            | string | null: false |
| housenumber        | string | null: false |
| building           | string | null: false |
| user               | references| null: false, foreign_key: true |
| items              | references| null: false, foreign_key: true |

### Association
- belongs_to : custmor

