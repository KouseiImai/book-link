## README

# ＜ アプリケーション名 ＞

### Book-Link
＜ アプリケーション名の意図 ＞<br>
本との繋がりができて欲しいという事と、本により他の読者の方ともつながって欲しいという思いでBook-Linkとしました。
# ＜ アプリケーション概要 ＞

書籍の登録・検索、登録済み書籍に対してのコメントが行えるWebアプリケーションです。<br>
書籍情報の登録時に感想や感情を記入し登録する形をとる事で、今の気分に適した書籍を見つける事を目的としています。

# ＜ 作成背景 ＞

書籍を探す際にタイトル・著者・ジャンルにて探す事が多く、現在の気分(感動したい,明るい気分になりたいなど)で書籍を検索する事が出来ると、更に色々な書籍に出会うことが可能になるのでは？と思い作成に至りました。
また、現在の気分で書籍を検索出来れば誰かの悩みの解決や人生をより良く出来るのではないかという思い、オンラインでの書籍購入ですと「書店での帯のコメントに惹かれた！」「店員さんのpopに惹かれた！」といった魅力や感覚で書籍を探す事が難しく、そういった点も補えないかという思いも込め作成しました。

# ＜ デプロイ先・テストアカウント ＞

<デプロイ先><br>
Heroku : https://book-link-28159.herokuapp.com/<br>
AWS : http://54.178.85.203/

<テストアカウント><br>
・Heroku、AWSのどちらにもゲストログインの機能があります。<br>
※ゲストログイン以外でのログイン時にご利用ください。(Heroku・AWSどちらでも共通で使用出来ます)<br>
(アカウント情報)<br>
Email : yamada@com<br>
Password : y123456<br>

# ＜ 利用方法 ＞

- 会員登録・ログイン
ヘッダー部分より会員登録・ログインページへ移り登録・ログインをして下さい。
<img width="532" alt="スクリーンショット 2021-01-08 11 49 24" src="https://user-images.githubusercontent.com/69197315/103969299-f7485380-51a8-11eb-800c-de582fb917d5.png">

- 書籍情報の登録
ログインユーザーのみが書籍情報の登録を行えます。
![ccb907f8201e279d579ee9d0b99b269c](https://user-images.githubusercontent.com/69197315/103970155-ebf62780-51aa-11eb-914d-aa1001df2eea.gif)

- 書籍情報の編集
書籍情報を登録したユーザーのみ書籍情報の編集が行えます。
![27e59d93d69ccad54a933d4ec84a1da1](https://user-images.githubusercontent.com/69197315/103970368-750d5e80-51ab-11eb-8439-9784de1d00f5.gif)

- 書籍の検索
気分での検索、キーワード検索、細かいジャンル検索と豊富な検索機能があります。
<img width="497" alt="スクリーンショット 2021-01-08 12 22 25" src="https://user-images.githubusercontent.com/69197315/103970699-375d0580-51ac-11eb-9ca0-afa2f1b72072.png">
インクリメンタルサーチも行えます
<img width="1183" alt="スクリーンショット 2021-01-02 23 42 48" src="https://user-images.githubusercontent.com/69197315/103970804-71c6a280-51ac-11eb-8993-8e5a2c3ed543.png">
<img width="1169" alt="スクリーンショット 2021-01-02 23 52 44" src="https://user-images.githubusercontent.com/69197315/103970830-7ee39180-51ac-11eb-8628-aecc8ac400fa.png">

- 書籍の詳細情報
書籍の詳細画面にて書籍情報の他にジャンルや内容も知れます。
<img width="1410" alt="スクリーンショット 2021-01-08 12 27 11" src="https://user-images.githubusercontent.com/69197315/103971654-85730880-51ae-11eb-8c91-6d285c2aea1e.png">

- 書籍情報へのコメント
感想の投稿はログインなしで行え、コメントの投稿はログインユーザーのみ行えます。
<img width="634" alt="スクリーンショット 2021-01-08 12 45 25" src="https://user-images.githubusercontent.com/69197315/103972538-902e9d00-51b0-11eb-92fd-928aff621916.png">

- マイページ
マイページにて登録した書籍の一覧が確認出来ます。
<img width="1396" alt="スクリーンショット 2021-01-08 12 41 41" src="https://user-images.githubusercontent.com/69197315/103972274-fff05800-51af-11eb-9be2-75615c5eab93.png">

# ＜ 工夫したポイント ＞

- openBDのAPIにて書籍のISBN情報から書籍を検索し情報の入力を簡易化。
- ISBN情報を使用しての検索にて、書籍のタイトル、カバー写真、著者、出版社、発売日、Cコード情報、キーワード、あらすじを自動入力出来るように実装。
- アプリケーションに登録されている書籍検索をキーワード、気分、ジャンルと豊富な検索が行えるように実装。また、キーワードや気分の検索時にはインクリメンタルサーチが行えるように実装。
- 他のユーザーの感想やコメントを見れるようコメント機能も追加。


# ＜ 使用技術(開発環境) ＞

- 言語 : HTML,CSS,Ruby,JavaScript,jQuery
- フレームワーク : Ruby on Rails(6.0.3.4)
- DB : MySQL
- サーバー : Heroku,AWS

# ＜ DB設計 ＞

<img width="1321" alt="スクリーンショット 2021-01-08 1 12 14" src="https://user-images.githubusercontent.com/69197315/103964749-8d777c00-519f-11eb-8927-285999b8bfac.png">

# ＜ 画面遷移図 ＞

<img width="1021" alt="スクリーンショット 2021-01-08 11 29 59" src="https://user-images.githubusercontent.com/69197315/103967317-13e28c80-51a5-11eb-9653-02dd66fb5f62.png">

# ＜ 今後の課題・追加したい機能 ＞

- コメントの編集・削除機能
- 性別や年齢別で登録されている書籍の検索機能
- 書籍のお気に入り登録機能(マイページにてお気に入り一覧の閲覧)
- 書籍をオススメしてくれる機能
- SNSアカウントでのログイン機能

# ＜ ローカルでの動作方法 ＞

### バージョン情報
- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
### 動作方法
- git clone後にbundle installを実施して下さい。
- データベースの作成とマイグレートの実行で利用可能となります。



