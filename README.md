## usersテーブル

| Column | Type | Options |
| ------ | --- | --- |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column | Type | Options |
| ------ | --- | --- |
| title | string | null: false |
| detail | text | null: false |
| category_id | integer | null: false |
| item_status_id | integer | null: false |
| delivery_charge_id | integer | null: false |
| prefecture_id | integer | null: false |
| ship_date_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


# purchasesテーブル

| Column | Type | Options |
| ------ | --- | --- |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


# addressesテーブル

| Column | Type | Options |
| ------ | --- | --- |
| postal_code | string | null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| district | string | null: false |
| building | string |  |
| phone_number | string | null: false |
| purchase | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


