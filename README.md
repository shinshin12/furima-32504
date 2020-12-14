# README
users テーブル

| column      |  type       |  options    |
|-------------|-------------|-------------|
| nickname    | string      |  null: false|
| email       | string      |  null: false|
| password    | string      |  null: false|
| name        | string      |  null: false|
| kana_name   | string      |  null: false|
| birthday    | integer     |  null: false| Active Hash使用

Association

- has_many :items
- has_many :comments

itemsテーブル

| column      |  type         |  options    |
|-------------|-------------  |-------------|
| image       | text          |             |Activestrage使用
| item_name   | string        |  null: false|
| explanation | text          |  null: false|
| item_price  | integer       |  null: false|
| seller      | string        |  null: false|
| user        |references     |  null: false, foreign_key: true｜

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

cardテーブル

| column        |  type       |  options    |
|---------------|-------------|-------------|
| price         | integer     |  null: false|
| item          | references  |  null: false, foreign_key: true

- belongs_to :item
- has_one :address

addressテーブル

| column         |  type       |  options    |
|----------------|-------------|-------------|
|  postal code   | integer     |  null: false|
|  prefecture    | string      |  null: false|  Actives Hash使用
|  city          | text        |  null: false|
|  house_number  | string      |  null: false|
|  building_name | string      |             |
|  phone_number  | integer     |  null: false|
|  card          | rederences  |  null: false, foreign_key: true

Association

belongs_to :card

