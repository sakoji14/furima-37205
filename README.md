# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| birthday           | integer | null: false |
| furigana           | string  | null: false |


- has_many :items
- has_many :comments

## items テーブル

| Column          | Type       | Options                        |
| ----------------| ------     | -----------                    |
| nickname        | string     | null: false                    |
| category        | string     | null: false                    |
| quality         | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| region          | string     | null: false                    |
| date            | string     | null: false                    |
| fee             | integer    | null: false                    |
| message         | string     | null: false                    |
| users_id        | references | null: false, foreign_key: true |


- has_many  :comments
- belong_to :users
- has_one   :purchases
- has_one   :address

##  purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| users_id         | references | null: false, foreign_key: true |
| items_id         | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :items

##  addresses テーブル

| Column      | Type       | Options      |
| ----------- | ---------- | -------------|
| post_number | integer    |  null: false |
| pref        | string     |  null: false |
| city        | string     |  null: false |
| mail        | string     |  null: false |
| build       | string     |  null: false |
| tell        | integer    |  null: false |

- belongs_to :items
- belongs_to :purchases

## comments テーブル
 
| Column  | Type        | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| users_id | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

- belongs_to :items
- belongs_to :users