# web_chatbot

初期ページ → / (home#top)

投稿ボタンを押す → post home/create (home#create)

投稿ボタンを押すと，home/craeteが呼び出され，PostgreSQLにデータ(テキスト，created_at，update_at)を格納する

# 個人的メモ (DEV)

## データベース

PostgreSQLを利用．

postgreデータベース/Postテーブル (ActiveRecordにはテーブル名はデータベース名+sとするルールがあるので，後ほど変更)(.env実装のタイミング？)

developmentでは，myapp_development データベースを利用．

| NAME | VALUE | OPTION |
| --- | --- | --- |
| post_id (PRIMARY KEY) | SERIAL | NOT NULL |
| content | TEXT | NOT NULL |
| created_at | timestamp with time zone |  |
| update_date | timestamp with time zone|  |


## やること

・自動的にDBが立ち上げられて，みんなが使えるようにする

・データを取得し，機械学習APIに投げるメソッド

・セキュリティ考慮(.env)