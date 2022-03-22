


*アプリケーション名*

御朱印アプリ

*アプリケーション概要*

自身の御朱印帳の記録をデジタルデータとして記録する。

*本番環境*

URL	 https://goshuin-app-36973.herokuapp.com/

*テスト用アカウント*	

taro:メールアドレス trc@451 パスワード：yxz1354

Basic認証等:ID admin/Pass 2222 

利用方法	ユーザー登録をして御朱印等の画像を投稿する。

目指した課題解決	御朱印帳を集めている人が紙媒体でなく、デジタルデータとして保存することを目指した。さらに御朱印を集めている人たちが集まり共有できるものとした。

*洗い出した要件*

            	サインイン/ログインページ

              トップページ（共有された写真を一覧表示するページ）

              共有された写真の詳細ページ

              共有写真を投稿するページ

              共有された写真の編集ページ

              マイページ

*実装した機能について*

画像投稿機能を実装

[![Image from Gyazo](https://i.gyazo.com/8780f43a684c0993d117cf49210a6046.gif)](https://gyazo.com/8780f43a684c0993d117cf49210a6046)

投稿ページの都道府県はプルダウンにて実装。

[![Image from Gyazo](https://i.gyazo.com/d7acc909f6dbe763890d36330f84e996.gif)](https://gyazo.com/d7acc909f6dbe763890d36330f84e996)

インデックスにカレンダーを表示

[![Image from Gyazo](https://i.gyazo.com/f2ac0f6e10802140b84d003801da3b1e.png)](https://gyazo.com/f2ac0f6e10802140b84d003801da3b1e)

おみくじ機能実装

[![Image from Gyazo](https://i.gyazo.com/ed13ce6c7120d42b4a7abe23ea5c68cc.gif)](https://gyazo.com/ed13ce6c7120d42b4a7abe23ea5c68cc)

データベース設計	[![Image from Gyazo](https://i.gyazo.com/fe925c810773996e54f54e4a8d1d537e.png)](https://gyazo.com/
fe925c810773996e54f54e4a8d1d537e)

*ローカルでの動作方法*

	git clone https://github.com/nagashi4/goshuin-app.git

（mySQL、Ruby:2.6.5p114 Rails: 6.0.4.4）


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

### Association

- has_many :stamps
- has_many :comments


## stamps テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| prefecture_id | integer       | null: false                    |
| place         | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| content      | text       | null:false                     |
| stamp        | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :stamp