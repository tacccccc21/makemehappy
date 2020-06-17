# README

# アプリ名 makemehappy

 
"makemehappy"とは
SNS感覚で使える商品レビューアプリです。
お気に入りに登録したり、投稿したりなど直感的に使えるようにしています。


# 制作背景kuhuusitatokoro
  
  
  
#  database 設計

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|text|text|null: false|
|image|string|null: false|
|star|integer||
|likes_count|integer||

### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes, source: :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|integer|null: false|
|nickname|integer|null: false|
|avatar|string|null: false||

### Association
- has_many :tweets, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_tweets, through: :likes, source: :tweet



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|tweet_id|integer|null: false|


### Association
- belongs_to :user
- belongs_to :tweet


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|tweet_id|integer|null: false|
|text|text|null: false|


### Association
- belongs_to :user
- belongs_to :tweet
 
# DEMO
 
星評価つき投稿
https://gyazo.com/e9f8b8afa5fc3821b02c6efa047b3249

いいね機能
https://gyazo.com/c76eaae09116d3b391e5339733888e5a

投稿にコメント
https://gyazo.com/007fff44a1ee815e9dd1df68837fb3a2

投稿のインクリメンタルサーチ
https://gyazo.com/8502a498000a19df167676e00c9e643a

ページのスクロール
https://gyazo.com/81afc255f1371736a52edd821f1f8cdb
 
# Features

snsの仕組みを利用した気軽に商品紹介できるサービスです。
買った商品を自慢したり、気になるアイテムのレビューを見て参考にしたりできます。
ショップサイトと違いお気軽にできると言った点で使いやすくなっています。
 


 

 
# Usage
 ```
$ git clone https://github.com/tacccccc21/makemehappy.git
$ cd makemehappy
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
👉 http://localhost:3000
```

- rails 5.2.4.3
- ruby 2.5.1p57

### テストユーザー
</br>
 名前 test
</br>
email test@test
</br>
password testtest
</br>

# Note
 
今後追加実装したい機能
- フォロー
- タグ付け
- ダイレクトメッセージ
- レスポンシブ対応


 
# Author
 

 
* 作成者 中川 拓飛

* E-mail tacccccc21@gmail.com

* Github tacccccc21