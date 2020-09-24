# README
# テーブル設計

## users テーブル
| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false
| email          | string | null: false |
| password       | string | null: false |
| confirmation   | string | null: false |
| firstname      | string | null: false |
| familyname     | string | null: false |
| firstnamekana  | string | null: false |
| familynamekana | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :items
- has_many :customers

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
- has_one :custmer

## customers　テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| user               | references| null: false, foreign_key: true |
| item               | references| null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item

## addresses  テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| postalcode         | string | null: false|
| area_id            | integer| null: false |
| housenumber        | string | null: false |
| building           | string | 
| telephone          | string | null: false |
| customer           | references| null: false, foreign_key: true |

### Association
belongs_to :customer

