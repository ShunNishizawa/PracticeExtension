# PracticeExtension

## 拡張とは？
- すでに存在するクラス、構造体、列挙型、及びプロトコルに新しい機能を追加することができる

## 拡張定義できるもの
- 計算型インスタンスプロパティ
- 格納型タイププロパティ、計算型タイププロパティ
- インスタンスメソッド、タイプメソッド
- イニシャライザ
- 添字付
- ネスト型定義

## 拡張定義
```
extension 型名: プロトコル列 {
  イニシャライザ定義
  計算型プロパティ定義
  メソッド定義
  その他定義
}
```

## 利用場面
自作したModifireを使いまわしたい時
- 例：背景タップしたらキーボードを下ろすとか、色々できる
利用例
```
struct HogeModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
          ~
    }
}

TextField("hogehoge", text: $text)
                .modifier(HogeModifire()) //一般的なモディファイアのような使い方をしたい！！

// Extensionを利用して書き換え
extension View {
    //hogeModifier
    func hogeModifier() -> some View {
        modifier(HogeModifire())
    }
}


TextField("hogehoge", text: $text)
                .hogeModifier()
```

## 参考文献
- [[SwiftUI]自作modifierをextensionで管理して使用する方法](https://zenn.dev/oka_yuuji/articles/cad02c4d42bd02)
- [詳解 Swift 第5版](https://www.amazon.co.jp/%E8%A9%B3%E8%A7%A3-Swift-%E7%AC%AC5%E7%89%88-%E8%8D%BB%E5%8E%9F-%E5%89%9B%E5%BF%97-ebook/dp/B081GK7636/ref=sr_1_3?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&crid=1Y7OHIDSGKFOR&keywords=Swift&qid=1653610989&sprefix=swift%2Caps%2C200&sr=8-3)
