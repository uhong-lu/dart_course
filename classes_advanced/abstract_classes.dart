import 'dart:math';

abstract class Shape{
  double get area; // not going to add a method body or the arrow notation with a return value
}


class Square extends Shape{
  Square(this.side);
  final double side;

  @override                 // have to override the abstract getter 'area'
  double get area => side * side;
  
}

class Circle extends Shape{
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape){
  print('Area: ${shape.area}');
}

void main(){
  // final shape = Shape();   // Cannot instantiate abstract class, have to create a concrete subclass og 'Shape'
  final square = Square(10); // instantiate the concrete subclass 'Square'
  printArea(square);
  final circle = Circle(5);
  printArea(circle);
  final shapes = [Square(2), Circle(3)];
  shapes.forEach((shape) => printArea(shape));
  shapes.forEach(printArea);
}






// /**
//  * 主題：抽象類別 (Abstract Classes) 與 介面合約
//  * 核心觀念：抽象類別定義「介面」，子類別負責「實作」。
//  */

// // [import]：匯入指令。 ['dart:math']：核心庫，提供圓周率 pi 運算。
// import 'dart:math';

// // [abstract class]：關鍵字，宣告一個「抽象類別」。
// // 💡 功能：這是一個設計圖的「規範」，不能被直接實例化 (不能呼叫 Shape())。
// abstract class Shape {
//   // [double get area;]：抽象的 Getter (讀取器)。
//   // 💡 特點：沒有本體 {}，也沒有箭頭 =>。
//   // 💡 意義：強制所有繼承 Shape 的類別必須提供 area 的具體計算邏輯。
//   double get area; 
// }

// // [extends Shape]：繼承關鍵字。Square 必須滿足 Shape 的合約。
// class Square extends Shape {
//   // [Square(this.side)]：構造函式。
//   // [this shorthand syntax]：將引數 (Argument) 直接賦值給屬性 side。
//   Square(this.side);

//   // [final double side]：實例變數 (Instance Variable / Property)。
//   final double side;

//   // [@override]：覆寫標籤。
//   // [double get area]：實作父類別要求的抽象 Getter。
//   // [=> side * side]：箭頭語法，計算正方形面積。
//   @override 
//   double get area => side * side;
// }

// class Circle extends Shape {
//   // [Circle(this.radius)]：構造函式。
//   Circle(this.radius);
  
//   // [final double radius]：儲存半徑的成員變數。
//   final double radius;

//   // [@override]：確保編譯器檢查此方法是否正確覆寫了父類別成員。
//   // [pi]：來自 dart:math 的常數。
//   @override
//   double get area => pi * radius * radius;
// }

// // [void printArea(Shape shape)]：全域函式。
// // [Shape shape]：參數 (Parameter)。
// // 💡 多型應用：這裡宣告接收 Shape 型別，因此你可以傳入 Square 或 Circle 的物件實例。
// void printArea(Shape shape) {
//   // [shape.area]：呼叫物件的計算屬性。
//   // 💡 這是「延遲綁定」：直到執行時，電腦才知道是去跑 Square 的 area 還是 Circle 的。
//   print('Area: ${shape.area}');
// }

// // [void main()]：進入點。
// void main() {
//   // ❌ 錯誤示範：final shape = Shape(); // 這行會報錯，因為抽象類別不可實例化。

//   // [final square]：宣告物件變數。 [Square(10)]：實例化具體子類別 (Concrete Subclass)。
//   final square = Square(10); 
  
//   // [printArea(square)]：將 Square 物件作為引數 (Argument) 傳遞。
//   printArea(square);

//   // [final circle]：實例化另一個具體子類別。
//   final circle = Circle(5);
//   printArea(circle);

//   // ---------------------------------------------------------
//   // 5. 集合與迭代器 (Collection & Iterators)
//   // ---------------------------------------------------------
  
//   // [final shapes]：List<Shape> 物件。裡面裝載了不同的子類別實例。
//   final shapes = [Square(2), Circle(3)];

//   // [forEach]：清單的迭代器方法 (Iterator Method)。
//   // [(shape) => ...]：匿名函式 (Lambda/Closure)。
//   // [shape]：當前被遍歷到的 Shape 物件。
//   shapes.forEach((shape) => printArea(shape));

//   // [shapes.forEach(printArea)]：函式撕離 (Function Tear-off) 語法。
//   // 💡 優雅寫法：直接將 printArea 函式當作引數傳入 forEach。
//   // forEach 會自動把 list 中的每個元素傳給 printArea 的參數。
//   shapes.forEach(printArea);
// }

// /**
//  * 🔬 深度技術總結：
//  * * 1. [Abstract Member]：
//  * 在 Shape 裡的 `area` 只有宣告型別，沒有邏輯。這是一種「權利與義務」的分配：
//  * Shape 擁有「被計算面積」的權利，而子類別負有「定義如何計算」的義務。
//  * * 2. [Type Polymorphism]：
//  * 因為 Square 是 Shape，所以 List<Shape> 可以裝正方形。這在開發中非常有用，
//  * 例如你可以有一個「形狀清單」，並一次處理它們，而不需關心具體細節。
//  * * 3. [Function Tear-off]：
//  * 最後一行的 `forEach(printArea)` 展示了 Dart 中函式是「一等公民」。
//  * 當參數名稱與數量完全吻合時，可以直接傳遞函式名。
//  */



// 什麼是抽象類別？
// 抽象類別是物件導向中定義「合約」的方式。它告訴所有子類別：「如果你想成為我的一員，你必須具備這些功能」。

// 不能被實例化：你不能建立一個 Shape 物件，因為「形狀」太抽象了，電腦不知道如何計算一個沒有具體型態之物體的面積。

// 定義抽象成員：它可以定義沒有「本體 {}」的方法或 Getter，強制要求子類別去實作。

// 多型 (Polymorphism)：它讓你可以寫出像 printArea(Shape shape) 這樣的函式，這個函式不關心傳進來的是圓形還是正方形，它只知道只要是「形狀」就一定有 area 可以讀取。








// import 'dart:math'; // 匯入數學庫以使用 pi

// /**
//  * [Part 1: 定義抽象規範]
//  * [abstract class]：關鍵字。
//  * 1. 定義一個「概念」而非「實體」。你無法在現實中拿到一個純粹的「形狀」，你只能拿到「正方形」或「圓形」。
//  * 2. 限制：不能被直接實例化 (Cannot be instantiated)。
//  */
// abstract class Shape {
//   // [Abstract Getter]：抽象屬性/讀取器。
//   // 💡 關鍵特徵：它以分號 (;) 結尾，沒有大括號 {} 或箭頭 =>。
//   // 💡 意義：這是一份「契約」。它規定所有繼承 Shape 的類別，都「必須」提供計算 area 的方法。
//   double get area; 
// }

// /**
//  * [Part 2: 實作具體類別 (Concrete Classes)]
//  * [extends]：繼承。Square 同意遵守 Shape 的契約。
//  */
// class Square extends Shape {
//   Square(this.side);
//   final double side;

//   // [@override]：覆寫。
//   // 這裡是 Square 履行契約的地方。它補上了 Shape 中缺失的計算邏輯。
//   @override
//   double get area => side * side; 
// }

// class Circle extends Shape {
//   Circle(this.radius);
//   final double radius;

//   // Circle 履行同一份契約，但實作邏輯完全不同（使用圓周率）。
//   @override
//   double get area => pi * radius * radius;
// }

// /**
//  * [Part 3: 多型 (Polymorphism) 的威力]
//  * [Shape shape]：參數型別是抽象的 Shape。
//  * 💡 這是抽象類別最強大的地方！
//  * 這個函式不需要寫兩個版本 (printSquareArea, printCircleArea)。
//  * 它只關心傳進來的東西「是不是 Shape」，只要是 Shape，就一定有 area 可以讀。
//  */
// void printArea(Shape shape) {
//   // 動態綁定 (Dynamic Binding)：
//   // 執行時，電腦會檢查 shape 到底是指向 Square 還是 Circle，然後呼叫對應的 getter。
//   print('Area: ${shape.area}');
// }

// void main() {
//   // [1. 實例化限制]
//   // final shape = Shape(); // ❌ 編譯錯誤！抽象類別不能建立物件，因為它是不完整的。

//   // [2. 具體化]
//   // 建立具體的子類別物件。
//   final square = Square(10); 
//   final circle = Circle(5);

//   // [3. 統一介面呼叫]
//   printArea(square); // 傳入 Square
//   printArea(circle); // 傳入 Circle

//   // [4. 集合中的多型]
//   // [List<Shape>]：這個清單宣告它裝的是 Shape。
//   // 因此，它可以同時容納 Square 和 Circle，因為它們「都是」Shape。
//   final shapes = [Square(2), Circle(3)];

//   // [Functional Iteration]
//   // 透過統一的介面 (printArea) 處理所有不同形狀的物件。
//   shapes.forEach((shape) => printArea(shape));
  
//   // [Tear-off]：簡寫語法，直接傳遞函式引用。
//   shapes.forEach(printArea);
// }