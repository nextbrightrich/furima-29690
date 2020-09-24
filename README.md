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
| birthday       | string | null: false |

### Association

- has_many :items
- has_many :custmor
- has_many :custmor, through: adresss

##  items テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| images             | string | null: false
| name               | string | null: false |
| description        | string | null: false |
| price              | string | null: false |
| category＿id       | string | null: false |
| status_id          | string | null: false |
| burden_id          | string | null: false |
| area_id            | string | null: false |
| days_id            | string | null: false |
| user_id            | string | null: false |

### Association
- belongs_to :user
- belongs_to :custmor
- belongs_to :custmor, through: adresss

## custmers テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| user_id            | string | null: false |
| items_id           | string | null: false |

### Association
- belongs_to :user
- has many : custmors
- has oner : adress

## adresss テーブル
| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| postalcode         | integer | null: false|
| area_id            | string | null: false |
| housenumber        | string | null: false |
| building           | string | null: false |
| userid             | string | null: false |
| items_id           | string | null: false |

### Association
- belongs_to : custmer , through: user
- belongs_to : custmor  through: itemes
- belongs_to : custmor

