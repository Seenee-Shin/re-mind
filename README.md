# 心の研究所 re:mind

![발표용-001_(3)](https://user-images.githubusercontent.com/86164711/161535504-7effbb5c-1ce6-4067-9d12-c23ef8811865.jpg)
<br></br>
## 🖥Site
http://remind-env.eba-m9figkvd.ap-northeast-1.elasticbeanstalk.com/

## 📁Notion 
https://www.notion.so/re-mind-f0ff3ac72f1e42ccb58e35b8b9792a0d

## ⏱ 開発期間

2021.12 ~ 2022.02
<br></br>

## 🛠 Tech Stack

`Java` `JavaScript` `Spring` `Gson` `css3` `HTML5` `JSON` `AJAX` `Tomcat`
<br></br>

## 💡 Topic

 - ### re:mindはリアルタイムです。<br/>
リマインド掲示板のポイントはリアルタイムです。 掲示板に書き込みが掲載されるたびにリアルタイムで反映して表示します。そしてコメントやスクラップいいね機能の許可を選び、他のユーザの参加をコントロールできます。さらに人に言いにくい秘密を話す匿名掲示板も存在します。
    <br/>
    
 - ### 自分の感情を記録してください。<br/>
心理認知治療の基本は、自分の感情を正確に理解することです。  毎日自分の感情を記録してみてください。 
<br/>

 - ### 行かなくても大丈夫です。<br/>
re:mindは病院に行かなくても相談サービスを受けられるよう、非対面相談サービスを実施しています。 チャット、電話、画像チャットなど、ご希望の種類のセラピーをお選びいただけます。また、[相談センター探し]で直接訪問も可能です。**（現在このサービスは中止しております。）**


 - ### チェックしてみてください。<br/>
相談を受けるのが負担でしたら、まず自分の状態をチェックしてみてください。 re:mindは自己診断テストをサポートします。 各種精神疾患について検診し、必要な場合は相談を行ってみてください。
<br/>
<br/>

## 📝 Summary

**うつ病、恐慌障害**など様々な精神疾患が増えていく傾向ですが、**精神疾患に対する偏見と嫌悪**はますますひどくなっています。

NA JAVAVARAは **『いかなる病気も嫌悪の対象であってはならない。』** という考えと**『どうして精神疾患は重いテーマで自然に話せないのか。』**という問い掛けに心の研究所 re:mindのプロジェクト始めました。
<br></br>


## 🧑🏻‍💻 Team

- Web developer 6人
<br></br>

## 🤚🏻 Part

- チームリーダー
- プロジェクト企画総括
- レスポンシブルウェブデザイン及び実装
- リアルタイム開示版CRUD
- リアルタイムコメントCRUD
- 5つの感情表現（いいね機能）
- 開示版スクラップ機能
- カウンセラー登録
<br></br>

## 🤔 Learned

- 画像ファイル選択時に`Ajax`で**複数画像をアップロード方法**を学びました。
- `AJAX` 通信を利用した**リアルタイム開示版**を実装してみました（ソーシャルメディア風）。
- `Json` **データ型でデータを処理**。
- `Spring`フレームワークを利用してプロジェクトを作成しました。
- カウンセラー登録時の**メール認証機能**を実装してみました。
- **レスポンシブルウェブ** の実装。
<br></br>

## 📑 Review

- コードの重複が非常に多かったと思います。**コードの再使用性**をもっと上げて行きたいと思います。
- データベース設計でテーブルを必要以上に細かく分けてしまいSQL文か複雑になる問題点がありました。
  データベースの正規化と非正規化を勉強し処理速度や複雑度を改善したいと思います。
- プロジェクト全般的に非同期処理を利用した結果、AJAXやJSONをより理解できることになりました。
- JQueryの使用が多かったと思いますJJQueryで作成したコードをJavaScriptに変えて行きたいと思います。
- データベースの設計ミスで速度が落ちたと思ったが、サーバーとクライアントの距離が遠くて起きた問題でした。アメリカだったサーバーを東京に変えて解決しました。　
<br></br>


## 📷 Screenshot
プロジェクトは韓国語で作成され、スクリーショットは日本語の自動翻訳を利用しました。 
誤訳がある可能性がございますのでご了承ください。

### メインページ
<hr></hr>

![localhost_8080_mind__(2)](https://user-images.githubusercontent.com/86164711/161535801-8f5f3a01-d912-4792-8624-3157c29c85c6.png)

### 相談予約
<hr></hr>

![localhost_8080_mind_pro_proList_(1)](https://user-images.githubusercontent.com/86164711/161535944-e624d19c-048a-4a98-b3da-593d9f7aa10d.png)
![localhost_8080_mind_pro_proView_174](https://user-images.githubusercontent.com/86164711/161542258-20b557c2-fad6-45fb-9d16-a77564a9ca8e.png)

### **自己心理診断**テスト
<hr></hr>

![localhost_8080_mind_selftest_selftestForm](https://user-images.githubusercontent.com/86164711/161536078-6f23e182-b899-4ed5-bc2c-0305606467bb.png)

### 開示版
<hr></hr>

![localhost_8080_mind_free_insert_(4)](https://user-images.githubusercontent.com/86164711/161536341-717558c8-18ae-40e9-a489-b333d4c295a8.png)

![localhost_8080_mind_free_view_2322_(5)](https://user-images.githubusercontent.com/86164711/161536384-8b347bd8-9b6f-4c9c-a7e1-a2200c3a6a07.png)

### 今月の研究
<hr></hr>

![localhost_8080_mind_post_list](https://user-images.githubusercontent.com/86164711/161536547-cae20c55-dad6-4053-89a3-2e000f63b20c.png)

### 感情記録
<hr></hr>

![localhost_8080_mind_my_emotionRecord](https://user-images.githubusercontent.com/86164711/161536597-21c8619b-7fa4-486f-9af9-d31c0f2b8dce.png)

![localhost_8080_mind_my_emotionDiary_(1)](https://user-images.githubusercontent.com/86164711/161536604-f98bd0b6-3ee5-4e0f-bdd3-9af0663dae26.png)


## 📝 Release notes
2022.04.15 ‐　デプロイ　<br/>
2022.05.12 - サーバー変更で速度が上がりました。
