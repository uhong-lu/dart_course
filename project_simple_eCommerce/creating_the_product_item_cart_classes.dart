// To follow along, add a pubspec.yaml file with the following contents to your project:
// name: test
// dsecription: A simple command-line application.
// #version: 1.0.0
// # honepage: https://example.com

// environment:
//   sdk: '>=2.12.0 <3.0.0'

// dependencies:
//   equatable: ^2.0.0

// dev_dependencies:
//   pedantic: ^1.11.0

// 主題：電商購物車類別設計 (E-commerce Class Design)
// 核心：建立 Product (商品) -> Item (購物項目) -> Cart (購物車) 的層級關係。
// 物件導向設計 (OOP) 基礎的學習筆記。

// 這個練習將教你如何像電商 App 一樣，把「商品 (Product)」、「購物項目 (Item)」和「購物車 (Cart)」這些現實世界的概念，轉化為程式碼中的類別結構。

// 我們將重點放在類別之間的關係 (Relationships)，以及如何透過屬性 (Properties) 來連結這些物件。


class Product{
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;
}

class Item{
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  double get price => quantity * product.price;
}

class Cart{
  //TODO: Add properties and methods to the Cart class
}











// /**
//  * 主題：電商購物車類別設計 (E-commerce Class Design)
//  * 核心：建立 Product (商品) -> Item (購物項目) -> Cart (購物車) 的層級關係。
//  */

// // ---------------------------------------------------------
// // 1. 商品類別 (Product Class)
// // ---------------------------------------------------------
// // [class Product]：定義商品的「基本資料」。
// // 這是一個「不可變 (Immutable)」的類別，因為商品一旦上架，ID 和名字通常不會變。
// class Product {
//   // [const Constructor]：常數建構子。
//   // [required this.id]：必填的 ID。
//   // [required this.name]：必填的商品名稱。
//   // [required this.price]：必填的單價。
//   const Product({required this.id, required this.name, required this.price});

//   // [final Properties]：一旦設定就不能改的屬性。
//   final int id;
//   final String name;
//   final double price;
// }

// // ---------------------------------------------------------
// // 2. 購物項目類別 (Item Class)
// // ---------------------------------------------------------
// // [class Item]：這代表「被放進購物車裡的東西」。
// // 💡 關鍵差異：Product 是商店賣的東西，Item 是你籃子裡的東西（包含數量）。
// class Item {
//   // [const Constructor]：同樣是不可變的。
//   // [required this.product]：必填。這個項目一定要對應到某個商品。
//   // [this.quantity = 1]：選填。預設數量為 1 (買東西至少買一個)。
//   const Item({required this.product, this.quantity = 1});

//   // [Composition (組合)]：Item "擁有 (has-a)" 一個 Product。
//   // 這裡存的是 Product 物件的記憶體地址 (Reference)。
//   final Product product;
  
//   // [int quantity]：購買數量。
//   final int quantity;

//   // [Getter (計算屬性)]：小計金額 (Subtotal)。
//   // [double get price]：定義一個讀取器，名稱叫 price。
//   // [=>]：箭頭語法。
//   // [quantity * product.price]：計算邏輯。
//   // 透過 product.price 存取內部 Product 物件的單價，再乘以數量。
//   double get price => quantity * product.price;
// }

// // ---------------------------------------------------------
// // 3. 購物車類別 (Cart Class)
// // ---------------------------------------------------------
// // [class Cart]：這代表「整台購物車」。
// // 它將會包含多個 Item 物件。
// class Cart {
//   // TODO: Add properties and methods to the Cart class
//   // 預告：這裡將會需要一個 List<Item> 來儲存所有選購的商品。
// }