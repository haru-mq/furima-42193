## user
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false, unique: true |
| encrypted_password  | string    | null: false |
| first_name          | string    | null: false |
| last_name           | string    | null: false |
| first_name_kana     | string    | null: false |
| last_name_kana      | string    | null: false |
| birthday            | date      | null: false |

### Association
has_many :items
has_many :records



## item
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | string     | null: false |
| item_description    | text       | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| fee_id              | integer    | null: false |
| prefecture_id       | integer    | null: false |
| ship_date_id        | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association
has_one :record
belong_to :user



## record
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
belong_to :item
belong_to :user
has_one :address



## address
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| post_number         | string     | null: false |
| prefecture_id       | integer    | null: false |
| city                | string     | null: false |
| house_number        | string     | null: false |
| building            | string     | -           |
| phone_number        | string     | null: false |
| record              | references | null: false, foreign_key: true |

### Association
belong_to :record