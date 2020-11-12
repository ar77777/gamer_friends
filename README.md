# アプリ名
##### Gamer friends

# 概要
##### 一緒にゲームをプレイできるフレンドを探せるアプリになります。
1. #### ユーザー管理機能
##### 新規登録やログイン機能などユーザーを管理できるようになっております。
2. #### 投稿機能
##### 普段自身がプレイしているゲームや時間帯を記入し、投稿できるようになっております。
3. #### コメント機能
##### 投稿の詳細ページにはコメント入力欄があり、気軽にコメントすることができます。
4. #### DM機能
##### プライベートな会話もできるメッセージ機能が備わっております。
5. #### 検索機能
##### ゲーム名や時間帯などのキーワードで検索可能です。
5. #### いいね機能
##### お気に入りの投稿を他ユーザーに周知できます。

# 本番環境
##### AWS/EC2
##### S3導入予定

# 制作背景
##### 私自身ゲームが好きなのでフレンドを探せる専門のアプリがあればと思い開発しました。
##### まず私が初めに取り組んだことは開発して需要があるかどうかです。Twitterでゲーム名 + 募集というキーワードにて検索をした結果、直近1週間(検索時は2020/10中旬頃)で該当する投稿が600~650件ヒットしました。その内他ユーザーからコメントがある投稿が1割程という結果でした。以上の結果からフレンド募集しているユーザーは大勢いるが、投稿→他ユーザーからコメントを貰う→フレンドになるという流れがあまりなく、ゲーム関連以外の投稿するも存在するTwitterではゲームフレンドを探すということが難しいのではと仮説を立て開発することとしました。

# 工夫した点
##### ・UI/UXはシンプルで分かりやすく
##### ・ユーザーがストレスなく使用して頂きたいと思いBootstrapを使用しレスポンシブ化
##### ・投稿、コメント、DM機能に非同期通信を実装

# 開発環境
### バックエンド
##### ・Ruby
##### ・Ruby on rails

### フロントエンド
##### ・HTML/CSS/Bootstrap/JavaScript

### データベース
#### ・MySQL

# 今後実装したい機能
##### ・自動/無限スクロール
##### ・フォロー/フォロワー機能
##### ・いいね一覧表示

# DB設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| sex_id   | integer | null: false |
| age_id   | integer | null: false |

### Association
- has_many :room_users, dependent: :destroy
- has_many :rooms, through: :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to_active_hash :sex
- belongs_to_active_hash :age
- has_one_attached :image

## posts テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| game_title | string     | null: false                    |
| platform   | string     | null: false                    |
| time_zone  | string     | null: false                    |
| call       | string     | null: false                    |
| text       | text       | null: false                    |
| call       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## rooms テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| id         | integer    | null: false |

### Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## likes テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

## likes テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post