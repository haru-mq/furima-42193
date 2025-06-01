## user
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false, unique: true |
| entrypted_password  | string    | null: false |
| first_name          | string    | null: false |
| last_name           | string    | null: false |
| first_name_kana     | string    | null: false |
| last_name_kana      | string    | null: false |
| birth_year          | string    | null: false |
| birth_month         | string    | null: false |
| birth_day           | string    | null: false |

### Association
has_many :items
has_many :records



## item
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| image               | string    | null: false |
| item_name           | string    | null: false |
| item_description    | string    | null: false |
| category            | string    | null: false |
| condition           | string    | null: false |
| fee                 | integer   | null: false |
| region              | string    | null: false |
| ship_date           | string    | null: false |
| price               | integer   | null: false |
| user                | reference | null: false, foreign_key: true |

### Association
has_one :records
belong_to :user



## record
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| item                | reference | null: false, foreign_key: true |
| user                | reference | null: false, foreign_key: true |

### Association
belong_to :item
belong_to :user
has_one :address



## address
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| post_number         | integer   | null: false |
| prefecture          | string    | null: false |
| city                | string    | null: false |
| house_number        | string    | null: false |
| building            | string    | -           |
| phone_number        | integer   | null: false |
| record              | reference | null: false, foreign_key: true |

### Association
belong_to :record