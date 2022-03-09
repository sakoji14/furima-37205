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
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |
| first_name         | string  | null: false |
| second_name        | string  | null: false |
| first_name_kana    | string  | null: false |
| second_name_kana   | string  | null: false |


- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| ----------------| ------     | -----------                    |
| nickname        | string     | null: false                    |
| category        | integer    | null: false                    |
| quality         | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| pref            | integer    | null: false                    |
| date            | integer    | null: false                    |
| fee             | integer    | null: false                    |
| message         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |


- has_many  :comments
- belong_to :user
- has_one   :purchase
- has_one   :address
- belongs_to_active_hash :category
- belongs_to_active_hash :quality
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :region
- belongs_to_active_hash :date

##  purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| users            | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

##  addresses テーブル

| Column      | Type       | Options      |
| ----------- | ---------- | -------------|
| post_number | integer    |  null: false |
| pref        | integer    |  null: false |
| city        | string     |  null: false |
| mail        | string     |  null: false |
| build       | string     |              |
| tell        | integer    |  null: false |

- belongs_to :item
- belongs_to :purchase
- has_one_active_hash :pref

## comments テーブル
 
| Column  | Type        | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| users    | references | null: false, foreign_key: true |
| items    | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user