# Eshooan

## 概要
「Eshooan」は、教員の授業予定の管理や授業担当の変更依頼、コメント機能などを提供するアプリケーションです。Deviseを使用してユーザー管理を行い、Simple Calendarを用いて予定表を作成します。

## テーブル

### Usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |

#### Associations
- has_many :comments
- has_many :homes
- has_many :helpers

### Commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

#### Associations
- belongs_to :user

### Homesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | text       | null: false                    |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

#### Associations
- belongs_to :user
- has_one :helper

### Helpersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| home    | references | null: false, foreign_key: true |

#### Associations
- belongs_to :user
- belongs_to :home

## 使い方
以下のステップに従ってアプリケーションを使用します。

1. ユーザー登録: Deviseを用いて新規登録、または既存のアカウントでログインします。
2. 授業予定の確認: ホーム画面にある予定表で授業予定を確認します。予定は「Homesテーブル」に記録されます。
3. コメントの投稿: 必要に応じて授業予定にコメントを追加します。コメントは「Commentsテーブル」に記録されます。
4. 授業担当の変更依頼: 必要に応じて授業の担当者変更を依頼します。「Helpersテーブル」が変更依頼の情報を管理します。

## その他
アプリケーションの詳細な機能や開発環境などについては、その他のドキュメントをご覧ください。
