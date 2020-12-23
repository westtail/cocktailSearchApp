# カクテル検索アプリ
![image](https://user-images.githubusercontent.com/40736515/94714698-74348780-0387-11eb-8248-2e0ae3785320.png)
## どんなアプリか
カクテルを名前や、味、度数、グラスタイプ、ベースのお酒で検索！  
検索したカクテルのレシピも確認することができる。  
ユーザー登録すれば、カクテルを登録できたり、お気に入りに追加できたり。  
お気に入り数でランキングもあるよ！  

## アプリのURL 
https://www.cocktailsearch.cf  
## 機能
* ユーザー登録機能、ログイン機能、ゲストログイン機能
* 検索機能(ransack)
* ページネーション機能(kaminari)
* カクテル投稿機能
  * 画像投稿機能(carrierwave)
* カクテルお気に入り機能
* ランキング機能

### (更新内容)
- [x] ver2アップデート
- [ ] ver3アップデート

### ver1~ver2
* スマホサイズに改善
* 検索機能の実装
* カクテルの登録機能
* javascriptを利用したUIの向上
* ユーザー機能
* お気に入り機能

### ver3
* ランキング機能
* ホーム画面追加
* 画像をS3で保存
* ゲストログイン機能
* circleCIでの自動テスト

## 使用技術

* ruby on rails 5.2.4
* ruby 2.5.1
* postgresSQL 11.5
* Nginx
* AWS 
  * VPC
  * EC2
  * SES
* Docker/Docker-compose

## インフラ周り
![環境図](https://user-images.githubusercontent.com/40736515/94824216-bb7e4f00-043f-11eb-8e81-c20b4391097b.png)
### https://github.com/westtail/cocktailApp から新しく作り直しています
