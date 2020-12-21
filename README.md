# README
users テーブル

| column               |  type       |  options    |
|----------------------|-------------|-------------|
| nickname             | string      |  null: false|
| email                | string      |  null: false, unique: true
| encrypted_password   | string      |  null: false|
| surname              | string      |  null: false|
| name                 | string      |  null: false|
| kana_surname         | string      |  null: false|
| kana_name            | string      |  null: false|
| birthday             | date        |  null: false| 

Association

- has_many :purchases
- has_many :items
- has_many :comments

itemsテーブル

| column             |  type         |  options    |
|--------------------|-------------  |-------------|
| item_name          | string        |  null: false|
| explanation        | text          |  null: false|
| category_id        | integer       |  null: false|
| state_id           | integer       |  null: false|
| shipping_method_id | integer       |  null: false|
| profecture_id      | integer       |  null: false|
| day_time_id        | integer       |  null: false|
| price              | integer       |  null: false|
| user               |references     |  null: false, foreign_key: true｜


Association

- belongs_to :user
- has_many :comments
- has_one :purchase

commentsテーブル

| column      |  type       |  options                        |
|-------------|-------------|---------------------------------|
| text        | text        |                                 |
| user        | references  |   null: false, foreign_key: true|
| item        | references  |   null: false, foreign_key: true|

Association

- belongs_to :user
- belongs_to :item

purchaseテーブル

| column        |  type       |  options    |
|---------------|-------------|-------------|
| user          | references  |  null: false, foreign_key: true|
| item          | references  |  null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :address

addressesテーブル

| column         |  type       |  options    |
|----------------|-------------|-------------|
|  postal_code   | string      |  null: false|
|  prefecture_id | integer     |  null: false|  
|  city          | string        |  null: false|
|  house_number  | string      |  null: false|
|  building_name | string      |             |
|  phone_number  | string      |  null: false|
|  purchase      | rederences  |  null: false, foreign_key: true

Association

belongs_to :purchase

