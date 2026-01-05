import 'dart:math';

abstract class Shape {
  double get area;
  const Shape();

  factory Shape.fromJson(Map<String, Object> json){
    final type = json['type'] ;
    switch(type){
      case 'square':
        final side = json['side'];
        if (side is double){
          return Square(side);
         }
         throw UnsupportedError('invalid or missing side property');
      case 'circle':
        final radius = json['radius'];
        if (radius is double){
          return Circle(radius);
        }
        throw UnsupportedError('invalid or missing radius property');
      default:
        throw UnimplementedError('Shape type $type is not recognized');
    }
  }
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print('The area is ${shape.area}');
}


void main(){
  final shapeJson = [
    {
      'type': 'square',
      'side': 10.0,
    },
    {
      'type': 'circle',
      'radius': 5.0,
    },
    {
      'type': 'triangle',
    }
  ];
  final shapes = shapeJson.map((jsonItem) => Shape.fromJson(jsonItem));
  shapes.forEach(printArea);
}

// How constructors are generated 
// if a class doesn't have any constructors,
//Dart will generate an implicit one with no arguments (and because of this , subclasses' constructors don't need to call super()).

//if a class one or more constructors, the implicit one with no arguments won't be generated(and subclasses's constructors don't have a super constructor that they can use)


// 這是一份關於 Dart 工廠建構子 (Factory Constructors) 與 JSON 數據解析 的進階學習筆記。在現代開發（特別是 Flutter 應用程式）中，這套模式是處理後端 API 回傳數據的標準作法。

// 🎯 本單元學習目標
// 理解 Factory Constructor 的核心作用：為什麼它能回傳子類別？

// 掌握 JSON 映射（Mapping）：如何將非結構化的 Map 轉換為強型別物件。

// 學習 多型 (Polymorphism) 的實戰應用：統一介面，多樣實作。

// 理解 建構子生成機制：隱含建構子與父類別初始化的關係。






// import 'dart:math';

// /// [Abstract Class]: 定義「形狀」的規範，作為所有具體形狀的父類別。
// abstract class Shape {
//   // [Abstract Getter]: 抽象屬性，強制子類別必須實作面積計算。
//   double get area;

//   // [Constant Constructor]: 抽象類別的常數建構子。
//   // 💡 為什麼要寫？為了支援子類別的 const 建構，即便這裡沒有屬性要初始化。
//   const Shape();

//   /// [Factory Constructor]: 工廠建構子。
//   /// [fromJson]: 具名建構子名稱，慣例用於處理 JSON 數據。
//   /// [Map<String, Object> json]: 參數接收一個鍵值對集合。
//   factory Shape.fromJson(Map<String, Object> json) {
//     // 1. 提取類別標籤 (Type Discriminator)
//     final type = json['type'];

//     // 2. 決策邏輯：根據標籤決定要生產哪一種具體物件。
//     switch (type) {
//       case 'square':
//         final side = json['side'];
//         // [Type Guard]: 檢查型別，確保解析過程的安全性。
//         if (side is double) {
//           // [Return Subtype]: 工廠建構子可以回傳子類別實體 (Square)。
//           return Square(side);
//         }
//         throw UnsupportedError('Invalid or missing side property');

//       case 'circle':
//         final radius = json['radius'];
//         if (radius is double) {
//           return Circle(radius);
//         }
//         throw UnsupportedError('Invalid or missing radius property');

//       default:
//         // 3. 錯誤處理：若遇到未定義的型別，拋出異常而非回傳空值。
//         throw UnimplementedError('Shape type $type is not recognized');
//     }
//   }
// }

// /// [Inheritance]: Square 「是一個」 Shape。
// class Square extends Shape {
//   // [this shorthand]: 接收引數並直接初始化成員變數。
//   Square(this.side);
//   final double side;

//   @override
//   double get area => side * side;
// }

// class Circle extends Shape {
//   Circle(this.radius);
//   final double radius;

//   @override
//   double get area => pi * radius * radius;
// }

// /// [Function as Callback]: 接受抽象型別作為參數，體現多型。
// void printArea(Shape shape) {
//   print('The area is ${shape.area}');
// }

// void main() {
//   // [Mock JSON Data]: 模擬從 API 抓取到的原始數據清單。
//   final shapeJson = [
//     {'type': 'square', 'side': 10.0},
//     {'type': 'circle', 'radius': 5.0},
//     {'type': 'triangle'} // 故意放入一個不支援的型別
//   ];

//   // [Collection Transformation]:
//   // 1. map 遍歷每個 Map 物件。
//   // 2. 呼叫 Shape.fromJson 工廠方法進行轉型。
//   // 3. 產生一個 Iterable<Shape>。
//   final shapes = shapeJson.map((json) {
//     try {
//       return Shape.fromJson(json);
//     } catch (e) {
//       print('解析失敗: $e');
//       return null;
//     }
//   }).whereType<Shape>(); // 過濾掉解析失敗的 null 值

//   // [Internal Iteration]: 執行列印任務。
//   shapes.forEach(printArea);
// }


// 程式碼逐行詳解
// 1. abstract class Shape
// 功能：定義型別邊界。

// 設計意義：我們不希望有人寫 Shape()。它是抽象的概念，這確保了系統中所有的形狀物件都必須擁有 area 這個屬性。

// 2. factory Shape.fromJson(...)
// 功能：對外提供一個統一的入口來建立不同的子類別物件。

// Why Factory?：

// 普通建構子 (Generative Constructor)：只能回傳「當前類別」的實體。如果你在 Shape 的普通建構子裡寫 return Square()，編譯會報錯。

// 工廠建構子 (Factory)：不一定要建立新實體，且可以回傳子類別。這在解析 JSON 時至關重要，因為你只有在讀到 json['type'] 後才知道要做出哪種形狀。

// 3. json['type'] 與 is double
// 概念：這是數據清洗 (Data Cleaning) 的過程。

// 誤解提醒：初學者常以為 JSON 取出來的值一定是對的。實際上，API 可能回傳字串 '10.0' 而非數字 10.0。使用 is 檢查或 double.tryParse 是資深工程師的防禦性習慣。

// 4. shapes.map(...)
// 語法：map 是一個 Iterator (迭代器) 方法。

// 機制：它是 Lazy (惰性) 的。除非你在後面接了 forEach 或 toList()，否則它不會真的去執行 Shape.fromJson 的轉換邏輯。這在處理大數據時能節省效能與記憶體。