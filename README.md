# README

# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| gender_id  | integer | null: false |
| age_id     | integer | null: false |

### Association
- has_many :books
- has_many :events
- has_many :comments


## books テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| user_id       | integer | null: false, foreign_key: true |
| title         | string  | null: false                    |
| author        | string  | null: false                    |
| publisher_id  | string  | null: false                    |
| genre_id      | integer | null: false                    |
| isbn          | string  |                                |

### Association
- belongs_to :user
- has_many :events, through :book_events 


## events テーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| book_id        | integer | null: false, foreign_key: true |
| event_name     | string  | null: false                    |
| event_comment  | text    | null: false                    |

### Association
- belongs_to :user
- has_many :books, through :book_events


## book_events テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| book_id   | references | null: false, foreign_key: true |
| event_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :event


## comments テーブル
| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| book_id   | integer | null: false, foreign_key: true |
| event_id  | integer | null: false, foreign_key: true |
| comment   | integer | null: false                    |

### Association
- belongs_to :user
- belongs_to :event
