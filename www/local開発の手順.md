## 実行コマンド
1. YAMLがあるフォルダまで移動
``` bash
$ cd /var/www/web_service
```
2. DB作成

```
$ docker-compose run web_chatbot_service rake db:create
```
3. 3000 番ポートで,Railsのサービス開始
```
$ docker-compose up
```
## 参考のコマンド
1. Rails で使うコマンドの実行(https://railsguides.jp/command_line.html) 下記のコマンドは"rails db:create"を行っている例
``` bash
$ docker-compose run web_chatbot_service rake db:create
```
2. 各 Dockerfile を変更したら，再度イメージを build する
```
$ docker-compose build --no-cache
```

## ローカル開発時のURL
http://localhost:3000/

- 参考サイト
    - https://docs.docker.com/compose/rails/#define-the-project (公式ドキュメント)
    - https://qiita.com/tomopict/items/23cc4332781bb28d2973 (Postgres の image の更新による仕様変更に対応した記事)

