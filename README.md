# テーブル設計

## Users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |

### Association

- has_many :items
- has_many :orders


## Orders テーブル

| Column               | Type           | Options                        |
| ------------------   | -------------- | --------------------------     |
| user                 | references     | null: false, foreign_key: true |
| item                 | references     | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## Address テーブル

| Column         | Type          | Options     |
| -----------    | ----------     | ----------- |
| postal_code    | integer        | null: false |
| prefecture     | string         | null: false |
| city           | string         | null: false |
| addresses      | string         | null: false |
| building_name  | string         | ----------- |
| phone_number   | integer        | null: false |
| oder           | references     | null: false, foreign_key: true |



### Association

- belongs_to :order

## Items テーブル

| Column               | Type          | Options                        |
| ------------------   | ------------- | ---------------------------    |
| image                | ------------- | ---------------------------    |
| name                 | string        | null: false                    |
| info                 | text          | null: false                    |
| category             | string        | null: false                    |
| sales_status         | text          | null: false                    |
| shopping fee status  | string        | null: false                    | 
| prefecture           | string        | null: false                    |    
| scheduled  delivery  | string        | null: false                    |
| user                 | references    | null: false, foreign_key: true |


### Association
- belongs_to :users     
- has_one :orders