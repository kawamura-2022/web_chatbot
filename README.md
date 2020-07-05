# web_chatbot
機械学習を用いたwebアプリケーションです．

発言の意見を分類し，適切な反応を返します．

研究で学んだ自然言語処理を応用しています．

## 制作目的
個々人が新技術を学ぶため．また，みんなで楽しく，助け合いながら，１つのサービスを作成する経験のため．

## 利用技術 (予定)
AWS, Docker, Ruby, Ruby on Rails 6, JavaScript, Go, Python, PostgreSQL

## データベース
#### POSTテーブル & AI_POSTテーブル

POSTテーブルではユーザーの投稿を，AI_POSTテーブルではAIの投稿を格納する．

| Column | Type | Options |
| --- | --- | --- |
| post_id | SERIAL | NOT NULL, PRIMARY KEY |
| content | TEXT | NOT NULL |
| created_at | timestamp with time zone|  |
| update_date | timestamp with time zone |  |

#### COMMENT_TEMPLATEテーブル

AIのコメントテンプレートが予め格納されているテーブル．

| Column | Type | Options |
| --- | --- | --- |
| id | SERIAL | NOT NULL, PRIMARY KEY |
| class | TEXT | NOT NULL |
| content | TEXT | NOT NULL |

### PRIVATE_KEY

APIのURLなどプライベートな情報が格納されているテーブル．

| Column | Type | Options |
| --- | --- | --- |
| id | SERIAL | NOT NULL, PRIMARY KEY |
| name | TEXT | NOT NULL |
| content | TEXT | NOT NULL |

## 作成者
インフラ

Naoki Kawamura (https://github.com/kawamura-2022)

フロントエンド

Atsuya Sakai (https://github.com/Sakai1711)

サーバーサイド

Takumi Sato (https://github.com/takuminoid)
