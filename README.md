## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |



## photos テーブル

| Column     | Type       | Options     |
| --------   | ------     | ----------- |
| title      | string     | null: false |
| describe   | text       | null: false |
| image      | Ac         | null: false |
| user       | references | null: false |


## comments テーブル
| Column     | Type       | Options     |
| --------   | ------     | ----------- |
| text       | text       | null: false |
| user       | references | null: false |
| photo      | references | null: false |
